///
//  Generated code. Do not modify.
//  source: SenseClient.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Audio extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Audio', package: const $pb.PackageName('sense.full.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..aInt64(2, 'segmentOffset', protoName: 'segmentOffset')
    ..a<$core.double>(3, 'segmentStartTime', $pb.PbFieldType.OD, protoName: 'segmentStartTime')
    ..hasRequiredFields = false
  ;

  Audio._() : super();
  factory Audio() => create();
  factory Audio.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Audio.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Audio clone() => Audio()..mergeFromMessage(this);
  Audio copyWith(void Function(Audio) updates) => super.copyWith((message) => updates(message as Audio));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Audio create() => Audio._();
  Audio createEmptyInstance() => create();
  static $pb.PbList<Audio> createRepeated() => $pb.PbList<Audio>();
  @$core.pragma('dart2js:noInline')
  static Audio getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Audio>(create);
  static Audio _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get segmentOffset => $_getI64(1);
  @$pb.TagNumber(2)
  set segmentOffset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSegmentOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegmentOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get segmentStartTime => $_getN(2);
  @$pb.TagNumber(3)
  set segmentStartTime($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSegmentStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearSegmentStartTime() => clearField(3);
}

class Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Event', package: const $pb.PackageName('sense.full.v1'), createEmptyInstance: create)
    ..aOS(1, 'tag')
    ..a<$core.double>(2, 'startTime', $pb.PbFieldType.OD, protoName: 'startTime')
    ..a<$core.double>(3, 'endTime', $pb.PbFieldType.OD, protoName: 'endTime')
    ..a<$core.double>(4, 'probability', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Event._() : super();
  factory Event() => create();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Event clone() => Event()..mergeFromMessage(this);
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tag => $_getSZ(0);
  @$pb.TagNumber(1)
  set tag($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get startTime => $_getN(1);
  @$pb.TagNumber(2)
  set startTime($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get endTime => $_getN(2);
  @$pb.TagNumber(3)
  set endTime($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get probability => $_getN(3);
  @$pb.TagNumber(4)
  set probability($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProbability() => $_has(3);
  @$pb.TagNumber(4)
  void clearProbability() => clearField(4);
}

class CochlSense extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CochlSense', package: const $pb.PackageName('sense.full.v1'), createEmptyInstance: create)
    ..aOS(1, 'service')
    ..pc<Event>(2, 'events', $pb.PbFieldType.PM, subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  CochlSense._() : super();
  factory CochlSense() => create();
  factory CochlSense.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CochlSense.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CochlSense clone() => CochlSense()..mergeFromMessage(this);
  CochlSense copyWith(void Function(CochlSense) updates) => super.copyWith((message) => updates(message as CochlSense));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CochlSense create() => CochlSense._();
  CochlSense createEmptyInstance() => create();
  static $pb.PbList<CochlSense> createRepeated() => $pb.PbList<CochlSense>();
  @$core.pragma('dart2js:noInline')
  static CochlSense getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CochlSense>(create);
  static CochlSense _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);
  @$pb.TagNumber(1)
  set service($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);
  @$pb.TagNumber(1)
  void clearService() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Event> get events => $_getList(1);
}

