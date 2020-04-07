///
//  Generated code. Do not modify.
//  source: SenseClient.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'SenseClient.pb.dart' as $0;
export 'SenseClient.pb.dart';

class SenseClient extends $grpc.Client {
  static final _$sense = $grpc.ClientMethod<$0.Request, $0.Response>(
      '/sense.full.v1.Sense/sense',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$sense_stream =
      $grpc.ClientMethod<$0.RequestStream, $0.Response>(
          '/sense.full.v1.Sense/sense_stream',
          ($0.RequestStream value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  SenseClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Response> sense($async.Stream<$0.Request> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sense, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.Response> sense_stream(
      $async.Stream<$0.RequestStream> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sense_stream, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class SenseServiceBase extends $grpc.Service {
  $core.String get $name => 'sense.full.v1.Sense';

  SenseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Response>(
        'sense',
        sense,
        true,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestStream, $0.Response>(
        'sense_stream',
        sense_stream,
        true,
        true,
        ($core.List<$core.int> value) => $0.RequestStream.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> sense(
      $grpc.ServiceCall call, $async.Stream<$0.Request> request);
  $async.Stream<$0.Response> sense_stream(
      $grpc.ServiceCall call, $async.Stream<$0.RequestStream> request);
}
