library sense_dart;

import './src/SenseClient.pb.dart';
import './src/SenseClient.pbgrpc.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';

final String hostAddress = 'sense.cochlear.ai';
final listOfTasks = ['event'];
final listOfFileformats = ['mp3', 'wav', 'ogg', 'flac', 'mp4'];

fileError(String fileName) {
  if (!File(fileName).existsSync()) {
    throw new ArgumentError('File not found');
  }
}

formatError(String fileFormat) {
  if (!listOfFileformats.contains(fileFormat)) {
    throw new ArgumentError('Invalid file format');
  }
}

taskError(String taskInput) {
  if (!listOfTasks.contains(taskInput)) {
    throw new ArgumentError(('Invalid task'));
  }
}

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
    throw new ArgumentError('Invalid API key');
  }
}

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
    throw new ArgumentError('Invalid API key');
  }

  await channel.shutdown();
}
