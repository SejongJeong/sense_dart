library sense_dart;

import './src/SenseClient.pb.dart';
import './src/SenseClient.pbgrpc.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';

///@nodoc
final String hostAddress = 'sense.cochlear.ai';

/// List of allowed Task.
///Task  can take one of the following values -
///
///    'event'
///
///    'speech' #SUPPORTS INCOMING
///
///    'music' #SUPPORTS INCOMING
///
final listOfTasks = ['event'];

/// List of allowed File Format.
///
/// File Format can take one of the following values -
///
/// 'mp3', 'wav', 'ogg', 'flac', 'mp4'
final listOfFileformats = ['mp3', 'wav', 'ogg', 'flac', 'mp4'];

///@nodoc
fileError(String fileName) {
  if (!File(fileName).existsSync()) {
    throw ArgumentError('File not found');
  }
}

///@nodoc
formatError(String fileFormat) {
  if (!listOfFileformats.contains(fileFormat)) {
    throw ArgumentError('Invalid file format');
  }
}

///@nodoc
taskError(String taskInput) {
  if (!listOfTasks.contains(taskInput)) {
    throw ArgumentError(('Invalid task'));
  }
}

/// Analyzes audio file and Returns it to JSON format.
///
/// First, make sure the audio file format is one of the listOfFileformats.
Future<String> sense(filename, apiKey, fileFormat, taskInput) async {
  // Exception Handling
  fileError(filename);
  formatError(fileFormat);
  taskError(taskInput);

  final channel = ClientChannel(
    hostAddress,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = SenseClient(channel);

  const CHUNK = 1024 * 1024;

  Stream<Request> getFileChunks(filename) async* {
    num i = 0;
    var audioByte = await new File(filename).readAsBytes();
    num st = 0;
    num end = 0;
    if (audioByte.length < CHUNK) {
      end = audioByte.length;
    } else {
      end = CHUNK;
    }
    while (true) {
      if (i != 0) {
        st += CHUNK;
        end += CHUNK;
      }
      if (end > audioByte.length && st < audioByte.length) {
        end = audioByte.length;
      } else if (end > audioByte.length && st > audioByte.length) {
        return;
      }
      List<int> temp = audioByte.sublist(st, end);
      i++;
      final requestData = Request()
        ..data = temp
        ..apikey = apiKey
        ..format = fileFormat
        ..task = taskInput;
      yield requestData;
    }
  }

  try {
    var chunksGenerator = getFileChunks(filename);
    var response = await stub.sense(chunksGenerator);
    return (response.outputs);
  } catch (e) {
    throw ArgumentError('Invalid API key');
  }
}

/// Analyzes audio stream and Returns it to JSON format stream.
///
/// The inputData must be PCM_Float and the sample rate must be 22050.
Stream<String> senseStream(inputData, apiKey, taskInput) async* {
  taskError(taskInput);

  final channel = ClientChannel(
    hostAddress,
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = SenseClient(channel);

  int sr = 22050;

  Stream<RequestStream> getStream(inputAudioStream) async* {
    await for (var audioData in inputAudioStream) {
      ByteBuffer buffer = new Float32List.fromList(audioData).buffer;
      List<int> intData = buffer.asUint8List();
      var streamRequest = RequestStream()
        ..data = intData
        ..apikey = apiKey
        ..sr = sr
        ..task = taskInput
        ..dtype = 'float32';
      yield streamRequest;
    }
  }

  try {
    var streamGenerator = getStream(inputData);
    var response = stub.sense_stream(streamGenerator);

    await for (var value in response) {
      yield value.outputs;
    }
  } catch (e) {
    throw ArgumentError('Invalid API key');
  }

  await channel.shutdown();
}
