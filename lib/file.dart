import './src/SenseClient.pb.dart';
import './src/SenseClient.pbgrpc.dart';
import './constant.dart';
import './result.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:grpc/grpc.dart';


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
    throw ArgumentError(fileFormat + ' format file is not supported');
  }
}

class file {
  final String _apiKey;
  final String _reader;
  final String _format;
  final String host;
  bool _inferenced;

  file(this._apiKey, this._reader, this._format, this.host) {
    _inferenced = false;
  }

  Stream<Request> _grpcRequests(filename) async* {
    num i = 0;
    var audioByte = await File(filename).readAsBytes();
    num st = 0;
    num end = 0;
    if (audioByte.length < MAX_DATA_SIZE) {
      end = audioByte.length;
    } else {
      end = MAX_DATA_SIZE;
    }
    while (true) {
      if (i != 0) {
        st += MAX_DATA_SIZE;
        end += MAX_DATA_SIZE;
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
        ..apikey = this._apiKey
        ..format = this._format
        ..apiVersion = API_VERSION
        ..userAgent = USER_AGENT;
      yield requestData;
    }
  }

  /// Analyzes audio file and Returns it to JSON format.
  ///
  /// First, make sure the audio file format is one of the listOfFileformats.
  Future<Result> inference() async {
    if(this._inferenced) {
      throw StateError("file was already inferenced");
    }
    this._inferenced = true;
    final List<int> selfSignedRoot = utf8.encode(SERVER_CA_CERTIFICATE);
    final channelCredentials = new ChannelCredentials.secure(certificates: selfSignedRoot);
    final channelOptions = new ChannelOptions(credentials: channelCredentials);
    final channel = ClientChannel(
        this.host,
        port: PORT,
        options: channelOptions
    );
    final stub = SenseClient(channel);
    try {
      var requests = _grpcRequests(this._reader);
      var result = await stub.sense(requests);
      return Result(result.outputs);
    } catch (e) {
      throw ArgumentError('Invalid API key');
    }
  }
}

class fileBuilder {
  String _apiKey;
  String _reader;
  String _format;
  String _host = HOST;

  void withApiKey(String apiKey) {
    this._apiKey = apiKey;
  }

  void withReader(String reader) {
    fileError(reader);
    this._reader = reader;
  }

  void withFormat(String format) {
    formatError(format);
    this._format = format;
  }

  void withHost(String host) {
    this._host = host;
  }

  file build() {
    final file fileBuild = file(_apiKey, _reader, _format, _host);
    return fileBuild;
  }
}
