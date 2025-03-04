//
//  Generated code. Do not modify.
//  source: assets/proto/mosque-dashboard.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'mosque-dashboard.pb.dart' as $0;
import 'mosque-dashboard.pbjson.dart';

export 'mosque-dashboard.pb.dart';

abstract class MosqueDashboardServiceBase extends $pb.GeneratedService {
  $async.Future<$0.GetDataForMobileAppRequest> getDataForMobileApp($pb.ServerContext ctx, $0.EmptyRequest request);
  $async.Future<$0.GenericReply> updateNamazTime($pb.ServerContext ctx, $0.NamazTime request);
  $async.Future<$0.GenericReply> changeHijriAdjustment($pb.ServerContext ctx, $0.HijriAdjustmentUpdateRequest request);
  $async.Future<$0.GenericReply> testAudio($pb.ServerContext ctx, $0.EmptyRequest request);
  $async.Future<$0.GenericReply> changeScreenSaverState($pb.ServerContext ctx, $0.ScreenSaverStateUpdateRequest request);
  $async.Future<$0.GenericReply> setDateTime($pb.ServerContext ctx, $0.StringContainer request);
  $async.Future<$0.GenericReply> restartSystem($pb.ServerContext ctx, $0.EmptyRequest request);
  $async.Future<$0.StringContainer> hasDateChanged($pb.ServerContext ctx, $0.EmptyRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetDataForMobileApp': return $0.EmptyRequest();
      case 'UpdateNamazTime': return $0.NamazTime();
      case 'ChangeHijriAdjustment': return $0.HijriAdjustmentUpdateRequest();
      case 'TestAudio': return $0.EmptyRequest();
      case 'ChangeScreenSaverState': return $0.ScreenSaverStateUpdateRequest();
      case 'SetDateTime': return $0.StringContainer();
      case 'RestartSystem': return $0.EmptyRequest();
      case 'HasDateChanged': return $0.EmptyRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetDataForMobileApp': return this.getDataForMobileApp(ctx, request as $0.EmptyRequest);
      case 'UpdateNamazTime': return this.updateNamazTime(ctx, request as $0.NamazTime);
      case 'ChangeHijriAdjustment': return this.changeHijriAdjustment(ctx, request as $0.HijriAdjustmentUpdateRequest);
      case 'TestAudio': return this.testAudio(ctx, request as $0.EmptyRequest);
      case 'ChangeScreenSaverState': return this.changeScreenSaverState(ctx, request as $0.ScreenSaverStateUpdateRequest);
      case 'SetDateTime': return this.setDateTime(ctx, request as $0.StringContainer);
      case 'RestartSystem': return this.restartSystem(ctx, request as $0.EmptyRequest);
      case 'HasDateChanged': return this.hasDateChanged(ctx, request as $0.EmptyRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MosqueDashboardServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MosqueDashboardServiceBase$messageJson;
}

