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

class CochlClient extends $grpc.Client {
  static final _$sensefile = $grpc.ClientMethod<$0.Audio, $0.CochlSense>(
      '/sense.full.v1.Cochl/sensefile',
      ($0.Audio value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CochlSense.fromBuffer(value));
  static final _$sensestream = $grpc.ClientMethod<$0.Audio, $0.CochlSense>(
      '/sense.full.v1.Cochl/sensestream',
      ($0.Audio value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CochlSense.fromBuffer(value));

  CochlClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.CochlSense> sensefile($async.Stream<$0.Audio> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sensefile, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.CochlSense> sensestream(
      $async.Stream<$0.Audio> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sensestream, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class CochlServiceBase extends $grpc.Service {
  $core.String get $name => 'sense.full.v1.Cochl';

  CochlServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Audio, $0.CochlSense>(
        'sensefile',
        sensefile,
        true,
        false,
        ($core.List<$core.int> value) => $0.Audio.fromBuffer(value),
        ($0.CochlSense value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Audio, $0.CochlSense>(
        'sensestream',
        sensestream,
        true,
        true,
        ($core.List<$core.int> value) => $0.Audio.fromBuffer(value),
        ($0.CochlSense value) => value.writeToBuffer()));
  }

  $async.Future<$0.CochlSense> sensefile(
      $grpc.ServiceCall call, $async.Stream<$0.Audio> request);
  $async.Stream<$0.CochlSense> sensestream(
      $grpc.ServiceCall call, $async.Stream<$0.Audio> request);
}
