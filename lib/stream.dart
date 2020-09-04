import 'package:fixnum/fixnum.dart';
import './metadata.dart';
import './proto/SenseClient.pb.dart';
import './proto/SenseClient.pbgrpc.dart';
import './constant.dart';
import './result.dart';
import 'dart:async' as async;
import 'dart:convert';
import 'package:grpc/grpc.dart';

const int MIN_RECOMMANDED_SAMPLING_RATE = 22050;

const Map STREAM_FORMAT = {"float32": 4, "float64": 8, "int32": 4, "int64": 8};

/// Analyzes audio stream and Returns it to JSON format stream.
///
/// The inputData must be PCM_Float Audio Stream and the sample rate must be 22050.
class Stream {
  final Metadata _metadata;
  final String _host;
  final int _maxEventsHistorySize;
  final async.Stream<List<num>> _streamer;

  ClientChannel _channel;
  bool _inferenced;

  Stream._(
      this._streamer, this._host, this._metadata, this._maxEventsHistorySize) {
    this._inferenced = false;
    this._channel = null;
  }

  async.Stream<Result> inference() async* {
    async.Stream<CochlSense> stream = _sendToGrpc();

    Result result;

    await for (var events in stream) {
      if (result == null) {
        result = Result(events);
      } else {
        result.appendNewResult(events, this._maxEventsHistorySize);
      }

      yield result;
    }
  }

  void close() async {
    if (!this._inferenced) {
      throw UnsupportedError(
          "canot close stream if this one was not inferenced");
    }
    if (this._channel == null) {
      throw ArgumentError("stream was already closed");
    }
    await this._channel.shutdown();
    this._channel = null;
  }

  async.Stream<Audio> _grpcRequests() async* {
    num offset = 0;
    await for (var audioData in _streamer) {
      var streamRequest = Audio()
        ..data = audioData
        ..segmentOffset = Int64(offset)
        ..segmentStartTime = 0;
      offset += audioData.length;
      yield streamRequest;
    }
  }

  async.Stream<CochlSense> _sendToGrpc() async* {
    if (this._inferenced) {
      throw StateError("stream was already inferenced");
    }
    this._inferenced = true;
    final List<int> selfSignedRoot = utf8.encode(SERVER_CA_CERTIFICATE);
    final channelCredentials =
        ChannelCredentials.secure(certificates: selfSignedRoot);
    final channelOptions = ChannelOptions(credentials: channelCredentials);

    String host = this._host.split(":")[0];
    int port = int.parse(this._host.split(":")[1]);

    this._channel = ClientChannel(host, port: port, options: channelOptions);
    final stub = CochlClient(this._channel,
        options: CallOptions(metadata: _metadata.toGRPCMetadata()));

    var requests = _grpcRequests();
    var response = stub.sensestream(requests);

    await for (var value in response) {
      yield value;
    }

    close();
  }
}

class StreamBuilder {
  String apiKey;
  async.Stream<List<num>> streamer;
  int samplingRate;
  String dataType;
  String host = HOST;
  int maxEventsHistorySize = 0;
  bool smartFiltering = false;

  StreamBuilder withApiKey(String apiKey) {
    this.apiKey = apiKey;
    return this;
  }

  StreamBuilder withStreamer(async.Stream<List<num>> streamer) {
    this.streamer = streamer;
    return this;
  }

  StreamBuilder withMaxEventsHistorySize(int n) {
    this.maxEventsHistorySize = n;
    return this;
  }

  StreamBuilder withSamplingRate(int samplingRate) {
    if (samplingRate < MIN_RECOMMANDED_SAMPLING_RATE) {
      print("a sampling rate of at least 22050 is recommanded");
    }
    this.samplingRate = samplingRate;
    return this;
  }

  StreamBuilder withDataType(String dataType) {
    if (!STREAM_FORMAT.containsKey(dataType)) {
      throw ArgumentError(dataType + " stream data type is not supported");
    }
    this.dataType = dataType;
    return this;
  }

  StreamBuilder withHost(String host) {
    this.host = host;
    return this;
  }

  StreamBuilder withSmartFiltering(bool smartFiltering) {
    this.smartFiltering = smartFiltering;
    return this;
  }

  Stream build() {
    final metadata = Metadata()
        .withApiKey(apiKey)
        .withStreamFormat(dataType, samplingRate)
        .withSmartFiltering(smartFiltering);
    return Stream._(streamer, host, metadata, maxEventsHistorySize);
  }
}
