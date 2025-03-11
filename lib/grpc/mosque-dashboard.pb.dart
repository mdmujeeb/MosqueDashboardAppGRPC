//
//  Generated code. Do not modify.
//  source: mosque-dashboard.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Request Beans
class NamazTime extends $pb.GeneratedMessage {
  factory NamazTime({
    AuthData? authData,
    $core.String? namazTimeName,
    $core.int? hour,
    $core.int? minute,
  }) {
    final $result = create();
    if (authData != null) {
      $result.authData = authData;
    }
    if (namazTimeName != null) {
      $result.namazTimeName = namazTimeName;
    }
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    return $result;
  }
  NamazTime._() : super();
  factory NamazTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NamazTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NamazTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOM<AuthData>(1, _omitFieldNames ? '' : 'authData', protoName: 'authData', subBuilder: AuthData.create)
    ..aOS(2, _omitFieldNames ? '' : 'namazTimeName', protoName: 'namazTimeName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NamazTime clone() => NamazTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NamazTime copyWith(void Function(NamazTime) updates) => super.copyWith((message) => updates(message as NamazTime)) as NamazTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NamazTime create() => NamazTime._();
  NamazTime createEmptyInstance() => create();
  static $pb.PbList<NamazTime> createRepeated() => $pb.PbList<NamazTime>();
  @$core.pragma('dart2js:noInline')
  static NamazTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NamazTime>(create);
  static NamazTime? _defaultInstance;

  @$pb.TagNumber(1)
  AuthData get authData => $_getN(0);
  @$pb.TagNumber(1)
  set authData(AuthData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthData() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthData() => clearField(1);
  @$pb.TagNumber(1)
  AuthData ensureAuthData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get namazTimeName => $_getSZ(1);
  @$pb.TagNumber(2)
  set namazTimeName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNamazTimeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamazTimeName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hour => $_getIZ(2);
  @$pb.TagNumber(3)
  set hour($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHour() => $_has(2);
  @$pb.TagNumber(3)
  void clearHour() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get minute => $_getIZ(3);
  @$pb.TagNumber(4)
  set minute($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinute() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinute() => clearField(4);
}

class GetDataForMobileAppRequest extends $pb.GeneratedMessage {
  factory GetDataForMobileAppRequest({
    NamazTime? fajrTime,
    NamazTime? zuhrTime,
    NamazTime? asrTime,
    NamazTime? ishaTime,
    NamazTime? jumuaTime,
    NamazTime? screenSaverOnTime,
    NamazTime? screenSaverOffTime,
    $core.int? hijriAdjustment,
    $core.int? hijriDate,
    $core.String? hijriMonth,
    $core.int? hijriYear,
  }) {
    final $result = create();
    if (fajrTime != null) {
      $result.fajrTime = fajrTime;
    }
    if (zuhrTime != null) {
      $result.zuhrTime = zuhrTime;
    }
    if (asrTime != null) {
      $result.asrTime = asrTime;
    }
    if (ishaTime != null) {
      $result.ishaTime = ishaTime;
    }
    if (jumuaTime != null) {
      $result.jumuaTime = jumuaTime;
    }
    if (screenSaverOnTime != null) {
      $result.screenSaverOnTime = screenSaverOnTime;
    }
    if (screenSaverOffTime != null) {
      $result.screenSaverOffTime = screenSaverOffTime;
    }
    if (hijriAdjustment != null) {
      $result.hijriAdjustment = hijriAdjustment;
    }
    if (hijriDate != null) {
      $result.hijriDate = hijriDate;
    }
    if (hijriMonth != null) {
      $result.hijriMonth = hijriMonth;
    }
    if (hijriYear != null) {
      $result.hijriYear = hijriYear;
    }
    return $result;
  }
  GetDataForMobileAppRequest._() : super();
  factory GetDataForMobileAppRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDataForMobileAppRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDataForMobileAppRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOM<NamazTime>(1, _omitFieldNames ? '' : 'fajrTime', protoName: 'fajrTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(2, _omitFieldNames ? '' : 'zuhrTime', protoName: 'zuhrTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(3, _omitFieldNames ? '' : 'asrTime', protoName: 'asrTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(4, _omitFieldNames ? '' : 'ishaTime', protoName: 'ishaTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(5, _omitFieldNames ? '' : 'jumuaTime', protoName: 'jumuaTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(6, _omitFieldNames ? '' : 'screenSaverOnTime', protoName: 'screenSaverOnTime', subBuilder: NamazTime.create)
    ..aOM<NamazTime>(7, _omitFieldNames ? '' : 'screenSaverOffTime', protoName: 'screenSaverOffTime', subBuilder: NamazTime.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'hijriAdjustment', $pb.PbFieldType.O3, protoName: 'hijriAdjustment')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'hijriDate', $pb.PbFieldType.O3, protoName: 'hijriDate')
    ..aOS(10, _omitFieldNames ? '' : 'hijriMonth', protoName: 'hijriMonth')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'hijriYear', $pb.PbFieldType.O3, protoName: 'hijriYear')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDataForMobileAppRequest clone() => GetDataForMobileAppRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDataForMobileAppRequest copyWith(void Function(GetDataForMobileAppRequest) updates) => super.copyWith((message) => updates(message as GetDataForMobileAppRequest)) as GetDataForMobileAppRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDataForMobileAppRequest create() => GetDataForMobileAppRequest._();
  GetDataForMobileAppRequest createEmptyInstance() => create();
  static $pb.PbList<GetDataForMobileAppRequest> createRepeated() => $pb.PbList<GetDataForMobileAppRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDataForMobileAppRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDataForMobileAppRequest>(create);
  static GetDataForMobileAppRequest? _defaultInstance;

  @$pb.TagNumber(1)
  NamazTime get fajrTime => $_getN(0);
  @$pb.TagNumber(1)
  set fajrTime(NamazTime v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFajrTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFajrTime() => clearField(1);
  @$pb.TagNumber(1)
  NamazTime ensureFajrTime() => $_ensure(0);

  @$pb.TagNumber(2)
  NamazTime get zuhrTime => $_getN(1);
  @$pb.TagNumber(2)
  set zuhrTime(NamazTime v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasZuhrTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearZuhrTime() => clearField(2);
  @$pb.TagNumber(2)
  NamazTime ensureZuhrTime() => $_ensure(1);

  @$pb.TagNumber(3)
  NamazTime get asrTime => $_getN(2);
  @$pb.TagNumber(3)
  set asrTime(NamazTime v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAsrTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearAsrTime() => clearField(3);
  @$pb.TagNumber(3)
  NamazTime ensureAsrTime() => $_ensure(2);

  @$pb.TagNumber(4)
  NamazTime get ishaTime => $_getN(3);
  @$pb.TagNumber(4)
  set ishaTime(NamazTime v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIshaTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearIshaTime() => clearField(4);
  @$pb.TagNumber(4)
  NamazTime ensureIshaTime() => $_ensure(3);

  @$pb.TagNumber(5)
  NamazTime get jumuaTime => $_getN(4);
  @$pb.TagNumber(5)
  set jumuaTime(NamazTime v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasJumuaTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumuaTime() => clearField(5);
  @$pb.TagNumber(5)
  NamazTime ensureJumuaTime() => $_ensure(4);

  @$pb.TagNumber(6)
  NamazTime get screenSaverOnTime => $_getN(5);
  @$pb.TagNumber(6)
  set screenSaverOnTime(NamazTime v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasScreenSaverOnTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearScreenSaverOnTime() => clearField(6);
  @$pb.TagNumber(6)
  NamazTime ensureScreenSaverOnTime() => $_ensure(5);

  @$pb.TagNumber(7)
  NamazTime get screenSaverOffTime => $_getN(6);
  @$pb.TagNumber(7)
  set screenSaverOffTime(NamazTime v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasScreenSaverOffTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearScreenSaverOffTime() => clearField(7);
  @$pb.TagNumber(7)
  NamazTime ensureScreenSaverOffTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get hijriAdjustment => $_getIZ(7);
  @$pb.TagNumber(8)
  set hijriAdjustment($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHijriAdjustment() => $_has(7);
  @$pb.TagNumber(8)
  void clearHijriAdjustment() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get hijriDate => $_getIZ(8);
  @$pb.TagNumber(9)
  set hijriDate($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHijriDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearHijriDate() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get hijriMonth => $_getSZ(9);
  @$pb.TagNumber(10)
  set hijriMonth($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHijriMonth() => $_has(9);
  @$pb.TagNumber(10)
  void clearHijriMonth() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get hijriYear => $_getIZ(10);
  @$pb.TagNumber(11)
  set hijriYear($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHijriYear() => $_has(10);
  @$pb.TagNumber(11)
  void clearHijriYear() => clearField(11);
}

class HijriAdjustmentUpdateRequest extends $pb.GeneratedMessage {
  factory HijriAdjustmentUpdateRequest({
    AuthData? authData,
    $core.int? hijriAdjustment,
  }) {
    final $result = create();
    if (authData != null) {
      $result.authData = authData;
    }
    if (hijriAdjustment != null) {
      $result.hijriAdjustment = hijriAdjustment;
    }
    return $result;
  }
  HijriAdjustmentUpdateRequest._() : super();
  factory HijriAdjustmentUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HijriAdjustmentUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HijriAdjustmentUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOM<AuthData>(1, _omitFieldNames ? '' : 'authData', protoName: 'authData', subBuilder: AuthData.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'hijriAdjustment', $pb.PbFieldType.O3, protoName: 'hijriAdjustment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HijriAdjustmentUpdateRequest clone() => HijriAdjustmentUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HijriAdjustmentUpdateRequest copyWith(void Function(HijriAdjustmentUpdateRequest) updates) => super.copyWith((message) => updates(message as HijriAdjustmentUpdateRequest)) as HijriAdjustmentUpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HijriAdjustmentUpdateRequest create() => HijriAdjustmentUpdateRequest._();
  HijriAdjustmentUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<HijriAdjustmentUpdateRequest> createRepeated() => $pb.PbList<HijriAdjustmentUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static HijriAdjustmentUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HijriAdjustmentUpdateRequest>(create);
  static HijriAdjustmentUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AuthData get authData => $_getN(0);
  @$pb.TagNumber(1)
  set authData(AuthData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthData() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthData() => clearField(1);
  @$pb.TagNumber(1)
  AuthData ensureAuthData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get hijriAdjustment => $_getIZ(1);
  @$pb.TagNumber(2)
  set hijriAdjustment($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHijriAdjustment() => $_has(1);
  @$pb.TagNumber(2)
  void clearHijriAdjustment() => clearField(2);
}

class ScreenSaverStateUpdateRequest extends $pb.GeneratedMessage {
  factory ScreenSaverStateUpdateRequest({
    AuthData? authData,
    $core.bool? isOn,
  }) {
    final $result = create();
    if (authData != null) {
      $result.authData = authData;
    }
    if (isOn != null) {
      $result.isOn = isOn;
    }
    return $result;
  }
  ScreenSaverStateUpdateRequest._() : super();
  factory ScreenSaverStateUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScreenSaverStateUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScreenSaverStateUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOM<AuthData>(1, _omitFieldNames ? '' : 'authData', protoName: 'authData', subBuilder: AuthData.create)
    ..aOB(2, _omitFieldNames ? '' : 'isOn', protoName: 'isOn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScreenSaverStateUpdateRequest clone() => ScreenSaverStateUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScreenSaverStateUpdateRequest copyWith(void Function(ScreenSaverStateUpdateRequest) updates) => super.copyWith((message) => updates(message as ScreenSaverStateUpdateRequest)) as ScreenSaverStateUpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScreenSaverStateUpdateRequest create() => ScreenSaverStateUpdateRequest._();
  ScreenSaverStateUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<ScreenSaverStateUpdateRequest> createRepeated() => $pb.PbList<ScreenSaverStateUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static ScreenSaverStateUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScreenSaverStateUpdateRequest>(create);
  static ScreenSaverStateUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AuthData get authData => $_getN(0);
  @$pb.TagNumber(1)
  set authData(AuthData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthData() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthData() => clearField(1);
  @$pb.TagNumber(1)
  AuthData ensureAuthData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isOn => $_getBF(1);
  @$pb.TagNumber(2)
  set isOn($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsOn() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOn() => clearField(2);
}

class StringContainer extends $pb.GeneratedMessage {
  factory StringContainer({
    AuthData? authData,
    $core.String? str,
  }) {
    final $result = create();
    if (authData != null) {
      $result.authData = authData;
    }
    if (str != null) {
      $result.str = str;
    }
    return $result;
  }
  StringContainer._() : super();
  factory StringContainer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StringContainer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StringContainer', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOM<AuthData>(1, _omitFieldNames ? '' : 'authData', protoName: 'authData', subBuilder: AuthData.create)
    ..aOS(2, _omitFieldNames ? '' : 'str')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StringContainer clone() => StringContainer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StringContainer copyWith(void Function(StringContainer) updates) => super.copyWith((message) => updates(message as StringContainer)) as StringContainer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringContainer create() => StringContainer._();
  StringContainer createEmptyInstance() => create();
  static $pb.PbList<StringContainer> createRepeated() => $pb.PbList<StringContainer>();
  @$core.pragma('dart2js:noInline')
  static StringContainer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StringContainer>(create);
  static StringContainer? _defaultInstance;

  @$pb.TagNumber(1)
  AuthData get authData => $_getN(0);
  @$pb.TagNumber(1)
  set authData(AuthData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthData() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthData() => clearField(1);
  @$pb.TagNumber(1)
  AuthData ensureAuthData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get str => $_getSZ(1);
  @$pb.TagNumber(2)
  set str($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearStr() => clearField(2);
}

class AuthData extends $pb.GeneratedMessage {
  factory AuthData({
    $core.String? userName,
    $core.String? password,
  }) {
    final $result = create();
    if (userName != null) {
      $result.userName = userName;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  AuthData._() : super();
  factory AuthData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthData', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthData clone() => AuthData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthData copyWith(void Function(AuthData) updates) => super.copyWith((message) => updates(message as AuthData)) as AuthData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthData create() => AuthData._();
  AuthData createEmptyInstance() => create();
  static $pb.PbList<AuthData> createRepeated() => $pb.PbList<AuthData>();
  @$core.pragma('dart2js:noInline')
  static AuthData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthData>(create);
  static AuthData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

/// The response message containing the response
class GenericReply extends $pb.GeneratedMessage {
  factory GenericReply({
    $core.String? description,
    $core.int? responseCode,
  }) {
    final $result = create();
    if (description != null) {
      $result.description = description;
    }
    if (responseCode != null) {
      $result.responseCode = responseCode;
    }
    return $result;
  }
  GenericReply._() : super();
  factory GenericReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenericReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenericReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'responseCode', $pb.PbFieldType.O3, protoName: 'responseCode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenericReply clone() => GenericReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenericReply copyWith(void Function(GenericReply) updates) => super.copyWith((message) => updates(message as GenericReply)) as GenericReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenericReply create() => GenericReply._();
  GenericReply createEmptyInstance() => create();
  static $pb.PbList<GenericReply> createRepeated() => $pb.PbList<GenericReply>();
  @$core.pragma('dart2js:noInline')
  static GenericReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenericReply>(create);
  static GenericReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get responseCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set responseCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResponseCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponseCode() => clearField(2);
}

class EmptyRequest extends $pb.GeneratedMessage {
  factory EmptyRequest() => create();
  EmptyRequest._() : super();
  factory EmptyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmptyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.mujeeb.mosquedashboard.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmptyRequest clone() => EmptyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmptyRequest copyWith(void Function(EmptyRequest) updates) => super.copyWith((message) => updates(message as EmptyRequest)) as EmptyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmptyRequest create() => EmptyRequest._();
  EmptyRequest createEmptyInstance() => create();
  static $pb.PbList<EmptyRequest> createRepeated() => $pb.PbList<EmptyRequest>();
  @$core.pragma('dart2js:noInline')
  static EmptyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyRequest>(create);
  static EmptyRequest? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
