///
//  Generated code. Do not modify.
//  source: SenseClient.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Request',
      package: const $pb.PackageName('sense.full.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..aOS(2, 'task')
    ..aOS(3, 'apikey')
    ..aOS(4, 'format')
    ..aOS(8, 'clientVersion')
    ..hasRequiredFields = false;

  Request._() : super();
  factory Request() => create();
  factory Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Request clone() => Request()..mergeFromMessage(this);
  Request copyWith(void Function(Request) updates) =>
      super.copyWith((message) => updates(message as Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get task => $_getSZ(1);
  @$pb.TagNumber(2)
  set task($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get apikey => $_getSZ(2);
  @$pb.TagNumber(3)
  set apikey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasApikey() => $_has(2);
  @$pb.TagNumber(3)
  void clearApikey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get format => $_getSZ(3);
  @$pb.TagNumber(4)
  set format($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFormat() => $_has(3);
  @$pb.TagNumber(4)
  void clearFormat() => clearField(4);

  @$pb.TagNumber(8)
  $core.String get clientVersion => $_getSZ(4);
  @$pb.TagNumber(8)
  set clientVersion($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasClientVersion() => $_has(4);
  @$pb.TagNumber(8)
  void clearClientVersion() => clearField(8);
}

class RequestStream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestStream',
      package: const $pb.PackageName('sense.full.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..aOS(2, 'task')
    ..aOS(3, 'apikey')
    ..aOS(5, 'dtype')
    ..a<$core.int>(6, 'sr', $pb.PbFieldType.O3)
    ..aOS(8, 'clientVersion')
    ..hasRequiredFields = false;

  RequestStream._() : super();
  factory RequestStream() => create();
  factory RequestStream.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RequestStream.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RequestStream clone() => RequestStream()..mergeFromMessage(this);
  RequestStream copyWith(void Function(RequestStream) updates) =>
      super.copyWith((message) => updates(message as RequestStream));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestStream create() => RequestStream._();
  RequestStream createEmptyInstance() => create();
  static $pb.PbList<RequestStream> createRepeated() =>
      $pb.PbList<RequestStream>();
  @$core.pragma('dart2js:noInline')
  static RequestStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestStream>(create);
  static RequestStream _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get task => $_getSZ(1);
  @$pb.TagNumber(2)
  set task($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get apikey => $_getSZ(2);
  @$pb.TagNumber(3)
  set apikey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasApikey() => $_has(2);
  @$pb.TagNumber(3)
  void clearApikey() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get dtype => $_getSZ(3);
  @$pb.TagNumber(5)
  set dtype($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDtype() => $_has(3);
  @$pb.TagNumber(5)
  void clearDtype() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sr => $_getIZ(4);
  @$pb.TagNumber(6)
  set sr($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSr() => $_has(4);
  @$pb.TagNumber(6)
  void clearSr() => clearField(6);

  @$pb.TagNumber(8)
  $core.String get clientVersion => $_getSZ(5);
  @$pb.TagNumber(8)
  set clientVersion($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasClientVersion() => $_has(5);
  @$pb.TagNumber(8)
  void clearClientVersion() => clearField(8);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Response',
      package: const $pb.PackageName('sense.full.v1'),
      createEmptyInstance: create)
    ..aOS(7, 'outputs')
    ..hasRequiredFields = false;

  Response._() : super();
  factory Response() => create();
  factory Response.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Response clone() => Response()..mergeFromMessage(this);
  Response copyWith(void Function(Response) updates) =>
      super.copyWith((message) => updates(message as Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response _defaultInstance;

  @$pb.TagNumber(7)
  $core.String get outputs => $_getSZ(0);
  @$pb.TagNumber(7)
  set outputs($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOutputs() => $_has(0);
  @$pb.TagNumber(7)
  void clearOutputs() => clearField(7);
}
