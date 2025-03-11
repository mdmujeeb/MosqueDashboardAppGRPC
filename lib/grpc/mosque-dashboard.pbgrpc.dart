//
//  Generated code. Do not modify.
//  source: mosque-dashboard.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'mosque-dashboard.pb.dart' as $0;

export 'mosque-dashboard.pb.dart';

@$pb.GrpcServiceName('com.mujeeb.mosquedashboard.grpc.MosqueDashboardService')
class MosqueDashboardServiceClient extends $grpc.Client {
  static final _$getDataForMobileApp = $grpc.ClientMethod<$0.EmptyRequest, $0.GetDataForMobileAppRequest>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/GetDataForMobileApp',
      ($0.EmptyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetDataForMobileAppRequest.fromBuffer(value));
  static final _$updateNamazTime = $grpc.ClientMethod<$0.NamazTime, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/UpdateNamazTime',
      ($0.NamazTime value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$changeHijriAdjustment = $grpc.ClientMethod<$0.HijriAdjustmentUpdateRequest, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/ChangeHijriAdjustment',
      ($0.HijriAdjustmentUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$testAudio = $grpc.ClientMethod<$0.EmptyRequest, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/TestAudio',
      ($0.EmptyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$changeScreenSaverState = $grpc.ClientMethod<$0.ScreenSaverStateUpdateRequest, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/ChangeScreenSaverState',
      ($0.ScreenSaverStateUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$setDateTime = $grpc.ClientMethod<$0.StringContainer, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/SetDateTime',
      ($0.StringContainer value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$restartSystem = $grpc.ClientMethod<$0.EmptyRequest, $0.GenericReply>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/RestartSystem',
      ($0.EmptyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericReply.fromBuffer(value));
  static final _$hasDateChanged = $grpc.ClientMethod<$0.EmptyRequest, $0.StringContainer>(
      '/com.mujeeb.mosquedashboard.grpc.MosqueDashboardService/HasDateChanged',
      ($0.EmptyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StringContainer.fromBuffer(value));

  MosqueDashboardServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetDataForMobileAppRequest> getDataForMobileApp($0.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDataForMobileApp, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> updateNamazTime($0.NamazTime request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNamazTime, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> changeHijriAdjustment($0.HijriAdjustmentUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeHijriAdjustment, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> testAudio($0.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$testAudio, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> changeScreenSaverState($0.ScreenSaverStateUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeScreenSaverState, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> setDateTime($0.StringContainer request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setDateTime, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenericReply> restartSystem($0.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restartSystem, request, options: options);
  }

  $grpc.ResponseFuture<$0.StringContainer> hasDateChanged($0.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hasDateChanged, request, options: options);
  }
}

@$pb.GrpcServiceName('com.mujeeb.mosquedashboard.grpc.MosqueDashboardService')
abstract class MosqueDashboardServiceBase extends $grpc.Service {
  $core.String get $name => 'com.mujeeb.mosquedashboard.grpc.MosqueDashboardService';

  MosqueDashboardServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EmptyRequest, $0.GetDataForMobileAppRequest>(
        'GetDataForMobileApp',
        getDataForMobileApp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
        ($0.GetDataForMobileAppRequest value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NamazTime, $0.GenericReply>(
        'UpdateNamazTime',
        updateNamazTime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NamazTime.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HijriAdjustmentUpdateRequest, $0.GenericReply>(
        'ChangeHijriAdjustment',
        changeHijriAdjustment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HijriAdjustmentUpdateRequest.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyRequest, $0.GenericReply>(
        'TestAudio',
        testAudio_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ScreenSaverStateUpdateRequest, $0.GenericReply>(
        'ChangeScreenSaverState',
        changeScreenSaverState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ScreenSaverStateUpdateRequest.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StringContainer, $0.GenericReply>(
        'SetDateTime',
        setDateTime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringContainer.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyRequest, $0.GenericReply>(
        'RestartSystem',
        restartSystem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
        ($0.GenericReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyRequest, $0.StringContainer>(
        'HasDateChanged',
        hasDateChanged_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmptyRequest.fromBuffer(value),
        ($0.StringContainer value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetDataForMobileAppRequest> getDataForMobileApp_Pre($grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async {
    return getDataForMobileApp(call, await request);
  }

  $async.Future<$0.GenericReply> updateNamazTime_Pre($grpc.ServiceCall call, $async.Future<$0.NamazTime> request) async {
    return updateNamazTime(call, await request);
  }

  $async.Future<$0.GenericReply> changeHijriAdjustment_Pre($grpc.ServiceCall call, $async.Future<$0.HijriAdjustmentUpdateRequest> request) async {
    return changeHijriAdjustment(call, await request);
  }

  $async.Future<$0.GenericReply> testAudio_Pre($grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async {
    return testAudio(call, await request);
  }

  $async.Future<$0.GenericReply> changeScreenSaverState_Pre($grpc.ServiceCall call, $async.Future<$0.ScreenSaverStateUpdateRequest> request) async {
    return changeScreenSaverState(call, await request);
  }

  $async.Future<$0.GenericReply> setDateTime_Pre($grpc.ServiceCall call, $async.Future<$0.StringContainer> request) async {
    return setDateTime(call, await request);
  }

  $async.Future<$0.GenericReply> restartSystem_Pre($grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async {
    return restartSystem(call, await request);
  }

  $async.Future<$0.StringContainer> hasDateChanged_Pre($grpc.ServiceCall call, $async.Future<$0.EmptyRequest> request) async {
    return hasDateChanged(call, await request);
  }

  $async.Future<$0.GetDataForMobileAppRequest> getDataForMobileApp($grpc.ServiceCall call, $0.EmptyRequest request);
  $async.Future<$0.GenericReply> updateNamazTime($grpc.ServiceCall call, $0.NamazTime request);
  $async.Future<$0.GenericReply> changeHijriAdjustment($grpc.ServiceCall call, $0.HijriAdjustmentUpdateRequest request);
  $async.Future<$0.GenericReply> testAudio($grpc.ServiceCall call, $0.EmptyRequest request);
  $async.Future<$0.GenericReply> changeScreenSaverState($grpc.ServiceCall call, $0.ScreenSaverStateUpdateRequest request);
  $async.Future<$0.GenericReply> setDateTime($grpc.ServiceCall call, $0.StringContainer request);
  $async.Future<$0.GenericReply> restartSystem($grpc.ServiceCall call, $0.EmptyRequest request);
  $async.Future<$0.StringContainer> hasDateChanged($grpc.ServiceCall call, $0.EmptyRequest request);
}
