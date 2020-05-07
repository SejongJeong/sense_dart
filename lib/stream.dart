import './src/SenseClient.pb.dart';
import './src/SenseClient.pbgrpc.dart';
import './constant.dart';
import './result.dart';
import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';

const int MIN_RECOMMANDED_SAMPLING_RATE = 22050;

const Map STREAM_FORMAT = {"float32": 4, "float64": 8, "int32": 4, "int64": 8};

/// Analyzes audio stream and Returns it to JSON format stream.
///
/// The inputData must be PCM_Float Audio Stream and the sample rate must be 22050.
class stream {
  final String _apiKey;
  final Stream<List<num>> _streamer;
  final int _samplingRate;
  final String _dataType;
  final String host;
  final int _maxEventsHistorySize;
  //List<int> _buffer;
  ClientChannel channel;
  bool _inferenced;

  stream(this._apiKey, this._streamer, this._samplingRate, this._dataType,
      this.host, this._maxEventsHistorySize) {
    this._inferenced = false;
    this.channel = null;
    //this._buffer = List<int>();
  }

  Stream inference() async* {
    Stream<String> resultStream = _sendToGrpc();
    Result result = Result.empty();
    await for (var value in resultStream) {
      result.appendNewResult(value, this._maxEventsHistorySize);
      yield result;
    }
  }

  void close() async {
    if (!this._inferenced) {
      throw UnsupportedError(
          "canot close stream if this one was not inferenced");
    }
    if (this.channel == null) {
      throw ArgumentError("stream was already closed");
    }
    await this.channel.shutdown();
    this.channel = null;
  }

  Stream<RequestStream> _grpcRequests() async* {
    await for (var audioData in _streamer) {
      var streamRequest = RequestStream()
        ..data = audioData
        ..apikey = this._apiKey
        ..sr = this._samplingRate
        ..dtype = _dataType
        ..apiVersion = API_VERSION
        ..userAgent = USER_AGENT;
      yield streamRequest;
    }
  }

  Stream<String> _sendToGrpc() async* {
    if (this._inferenced) {
      throw StateError("stream was already inferenced");
    }
    this._inferenced = true;
    final List<int> selfSignedRoot = utf8.encode(SERVER_CA_CERTIFICATE);
    final channelCredentials =
        ChannelCredentials.secure(certificates: selfSignedRoot);
    final channelOptions = ChannelOptions(credentials: channelCredentials);
    this.channel =
        ClientChannel(this.host, port: PORT, options: channelOptions);
    final stub = SenseClient(this.channel);

    try {
      var requests = _grpcRequests();
      var response = stub.sense_stream(requests);

      await for (var value in response) {
        yield value.outputs;
      }
    } catch (e) {
      throw e;
    }
  }
}

class streamBuilder {
  String _apiKey;
  Stream<List<num>> _streamer;
  int _samplingRate;
  String _dataType;
  String _host = HOST;
  int _maxEventsHistorySize = 0;

  void withApiKey(String apiKey) {
    this._apiKey = apiKey;
  }

  void withStreamer(Stream<List<num>> streamer) {
    this._streamer = streamer;
  }

  void withMaxEventsHistorySize(int n) {
    this._maxEventsHistorySize = n;
  }

  void withSamplingRate(int samplingRate) {
    if (samplingRate < MIN_RECOMMANDED_SAMPLING_RATE) {
      print("a sampling rate of at least 22050 is recommanded");
    }
    this._samplingRate = samplingRate;
  }

  void withDataType(String dataType) {
    if (!STREAM_FORMAT.containsKey(dataType)) {
      throw ArgumentError(dataType + " stream data type is not supported");
    }
    this._dataType = dataType;
  }

  void withHost(String host) {
    this._host = host;
  }

  stream build() {
    final stream streamBuild = stream(_apiKey, _streamer, _samplingRate,
        _dataType, _host, _maxEventsHistorySize);
    return streamBuild;
  }
}
