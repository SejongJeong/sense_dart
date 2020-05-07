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
    ..aOS(2, 'apikey')
    ..aOS(3, 'format')
    ..aOS(4, 'apiVersion')
    ..aOS(5, 'userAgent')
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
  $core.String get apikey => $_getSZ(1);
  @$pb.TagNumber(2)
  set apikey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasApikey() => $_has(1);
  @$pb.TagNumber(2)
  void clearApikey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get format => $_getSZ(2);
  @$pb.TagNumber(3)
  set format($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormat() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get apiVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set apiVersion($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasApiVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearApiVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userAgent => $_getSZ(4);
  @$pb.TagNumber(5)
  set userAgent($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserAgent() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserAgent() => clearField(5);
}

class RequestStream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestStream',
      package: const $pb.PackageName('sense.full.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..aOS(2, 'apikey')
    ..aOS(3, 'dtype')
    ..a<$core.int>(4, 'sr', $pb.PbFieldType.O3)
    ..aOS(5, 'apiVersion')
    ..aOS(6, 'userAgent')
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
  $core.String get apikey => $_getSZ(1);
  @$pb.TagNumber(2)
  set apikey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasApikey() => $_has(1);
  @$pb.TagNumber(2)
  void clearApikey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dtype => $_getSZ(2);
  @$pb.TagNumber(3)
  set dtype($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDtype() => $_has(2);
  @$pb.TagNumber(3)
  void clearDtype() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sr => $_getIZ(3);
  @$pb.TagNumber(4)
  set sr($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSr() => $_has(3);
  @$pb.TagNumber(4)
  void clearSr() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get apiVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set apiVersion($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasApiVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearApiVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userAgent => $_getSZ(5);
  @$pb.TagNumber(6)
  set userAgent($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUserAgent() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserAgent() => clearField(6);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Response',
      package: const $pb.PackageName('sense.full.v1'),
      createEmptyInstance: create)
    ..aOS(1, 'outputs')
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

  @$pb.TagNumber(1)
  $core.String get outputs => $_getSZ(0);
  @$pb.TagNumber(1)
  set outputs($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutputs() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutputs() => clearField(1);
}
