import 'dart:typed_data';
import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:cochl_sense/metadata.dart';
import 'dart:math';

import './proto/SenseClient.pbgrpc.dart';
import './constant.dart';
import './result.dart';

/// List of allowed File Format.
///
/// File Format can take one of the following values -
///
/// 'mp3', 'wav', 'ogg', 'flac', 'mp4'
final listOfFileformats = ['mp3', 'wav', 'ogg', 'flac', 'mp4'];

class File {
  final String _host;
  final Metadata _metadata;
  final Uint8List _reader;

  bool _inferenced;

  File._(this._reader, this._host, this._metadata) {
    _inferenced = false;
  }

  Stream<Audio> _grpcRequests() async* {
    for (num offset = 0; offset < _reader.length; offset += MAX_DATA_SIZE) {
      num end = min(offset + MAX_DATA_SIZE, _reader.length);
      List<int> temp = _reader.sublist(offset, end);
      final requestData = Audio()
        ..data = temp
        ..segmentStartTime = 0
        ..segmentOffset = Int64(offset);
      yield requestData;
    }
  }

  /// Analyzes audio file and Returns it to JSON format.
  ///
  /// First, make sure the audio file format is one of the listOfFileformats.
  Future<Result> inference() async {
    if (this._inferenced) {
      throw StateError("file was already inferenced");
    }

    this._inferenced = true;
    final List<int> selfSignedRoot = utf8.encode(SERVER_CA_CERTIFICATE);
    final channelCredentials =
        ChannelCredentials.secure(certificates: selfSignedRoot);
    final channelOptions = ChannelOptions(credentials: channelCredentials);

    String host = this._host.split(":")[0];
    int port = int.parse(this._host.split(":")[1]);

    final channel = ClientChannel(host, port: port, options: channelOptions);
    final stub = CochlClient(channel);

    var requests = _grpcRequests();
    var response = await stub.sensefile(requests,
        options: CallOptions(metadata: this._metadata.toGRPCMetadata()));

    channel.shutdown();
    return Result(response);
  }
}

class FileBuilder {
  String apiKey;
  Uint8List reader;
  String format;
  bool smartFiltering = false;
  String host = HOST;

  FileBuilder withApiKey(String apiKey) {
    this.apiKey = apiKey;
    return this;
  }

  FileBuilder withReader(Uint8List reader) {
    this.reader = reader;
    return this;
  }

  FileBuilder withFormat(String format) {
    if (!listOfFileformats.contains(format)) {
      throw ArgumentError(format + ' format file is not supported');
    }
    this.format = format;
    return this;
  }

  FileBuilder withHost(String host) {
    this.host = host;
    return this;
  }

  FileBuilder withSmartFiltering(bool smartFiltering) {
    this.smartFiltering = smartFiltering;
    return this;
  }

  File build() {
    final metadata = Metadata()
        .withApiKey(apiKey)
        .withFileFormat(format)
        .withSmartFiltering(smartFiltering);
    return File._(reader, host, metadata);
  }
}
