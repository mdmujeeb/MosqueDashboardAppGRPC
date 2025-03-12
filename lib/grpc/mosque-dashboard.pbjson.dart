//
//  Generated code. Do not modify.
//  source: mosque-dashboard.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use namazTimeDescriptor instead')
const NamazTime$json = {
  '1': 'NamazTime',
  '2': [
    {'1': 'authData', '3': 1, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.AuthData', '10': 'authData'},
    {'1': 'namazTimeName', '3': 2, '4': 1, '5': 9, '10': 'namazTimeName'},
    {'1': 'hour', '3': 3, '4': 1, '5': 5, '10': 'hour'},
    {'1': 'minute', '3': 4, '4': 1, '5': 5, '10': 'minute'},
  ],
};

/// Descriptor for `NamazTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List namazTimeDescriptor = $convert.base64Decode(
    'CglOYW1helRpbWUSRQoIYXV0aERhdGEYASABKAsyKS5jb20ubXVqZWViLm1vc3F1ZWRhc2hib2'
    'FyZC5ncnBjLkF1dGhEYXRhUghhdXRoRGF0YRIkCg1uYW1helRpbWVOYW1lGAIgASgJUg1uYW1h'
    'elRpbWVOYW1lEhIKBGhvdXIYAyABKAVSBGhvdXISFgoGbWludXRlGAQgASgFUgZtaW51dGU=');

@$core.Deprecated('Use getDataForMobileAppRequestDescriptor instead')
const GetDataForMobileAppRequest$json = {
  '1': 'GetDataForMobileAppRequest',
  '2': [
    {'1': 'fajrTime', '3': 1, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'fajrTime'},
    {'1': 'zuhrTime', '3': 2, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'zuhrTime'},
    {'1': 'asrTime', '3': 3, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'asrTime'},
    {'1': 'ishaTime', '3': 4, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'ishaTime'},
    {'1': 'jumuaTime', '3': 5, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'jumuaTime'},
    {'1': 'ishraqTime', '3': 6, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'ishraqTime'},
    {'1': 'duhaTime', '3': 7, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'duhaTime'},
    {'1': 'suhurTime', '3': 8, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'suhurTime'},
    {'1': 'iftarTime', '3': 9, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'iftarTime'},
    {'1': 'screenSaverOnTime', '3': 10, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'screenSaverOnTime'},
    {'1': 'screenSaverOffTime', '3': 11, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.NamazTime', '10': 'screenSaverOffTime'},
    {'1': 'hijriAdjustment', '3': 12, '4': 1, '5': 5, '10': 'hijriAdjustment'},
    {'1': 'hijriDate', '3': 13, '4': 1, '5': 5, '10': 'hijriDate'},
    {'1': 'hijriMonth', '3': 14, '4': 1, '5': 9, '10': 'hijriMonth'},
    {'1': 'hijriYear', '3': 15, '4': 1, '5': 5, '10': 'hijriYear'},
  ],
};

/// Descriptor for `GetDataForMobileAppRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDataForMobileAppRequestDescriptor = $convert.base64Decode(
    'ChpHZXREYXRhRm9yTW9iaWxlQXBwUmVxdWVzdBJGCghmYWpyVGltZRgBIAEoCzIqLmNvbS5tdW'
    'plZWIubW9zcXVlZGFzaGJvYXJkLmdycGMuTmFtYXpUaW1lUghmYWpyVGltZRJGCgh6dWhyVGlt'
    'ZRgCIAEoCzIqLmNvbS5tdWplZWIubW9zcXVlZGFzaGJvYXJkLmdycGMuTmFtYXpUaW1lUgh6dW'
    'hyVGltZRJECgdhc3JUaW1lGAMgASgLMiouY29tLm11amVlYi5tb3NxdWVkYXNoYm9hcmQuZ3Jw'
    'Yy5OYW1helRpbWVSB2FzclRpbWUSRgoIaXNoYVRpbWUYBCABKAsyKi5jb20ubXVqZWViLm1vc3'
    'F1ZWRhc2hib2FyZC5ncnBjLk5hbWF6VGltZVIIaXNoYVRpbWUSSAoJanVtdWFUaW1lGAUgASgL'
    'MiouY29tLm11amVlYi5tb3NxdWVkYXNoYm9hcmQuZ3JwYy5OYW1helRpbWVSCWp1bXVhVGltZR'
    'JKCgppc2hyYXFUaW1lGAYgASgLMiouY29tLm11amVlYi5tb3NxdWVkYXNoYm9hcmQuZ3JwYy5O'
    'YW1helRpbWVSCmlzaHJhcVRpbWUSRgoIZHVoYVRpbWUYByABKAsyKi5jb20ubXVqZWViLm1vc3'
    'F1ZWRhc2hib2FyZC5ncnBjLk5hbWF6VGltZVIIZHVoYVRpbWUSSAoJc3VodXJUaW1lGAggASgL'
    'MiouY29tLm11amVlYi5tb3NxdWVkYXNoYm9hcmQuZ3JwYy5OYW1helRpbWVSCXN1aHVyVGltZR'
    'JICglpZnRhclRpbWUYCSABKAsyKi5jb20ubXVqZWViLm1vc3F1ZWRhc2hib2FyZC5ncnBjLk5h'
    'bWF6VGltZVIJaWZ0YXJUaW1lElgKEXNjcmVlblNhdmVyT25UaW1lGAogASgLMiouY29tLm11am'
    'VlYi5tb3NxdWVkYXNoYm9hcmQuZ3JwYy5OYW1helRpbWVSEXNjcmVlblNhdmVyT25UaW1lEloK'
    'EnNjcmVlblNhdmVyT2ZmVGltZRgLIAEoCzIqLmNvbS5tdWplZWIubW9zcXVlZGFzaGJvYXJkLm'
    'dycGMuTmFtYXpUaW1lUhJzY3JlZW5TYXZlck9mZlRpbWUSKAoPaGlqcmlBZGp1c3RtZW50GAwg'
    'ASgFUg9oaWpyaUFkanVzdG1lbnQSHAoJaGlqcmlEYXRlGA0gASgFUgloaWpyaURhdGUSHgoKaG'
    'lqcmlNb250aBgOIAEoCVIKaGlqcmlNb250aBIcCgloaWpyaVllYXIYDyABKAVSCWhpanJpWWVh'
    'cg==');

@$core.Deprecated('Use hijriAdjustmentUpdateRequestDescriptor instead')
const HijriAdjustmentUpdateRequest$json = {
  '1': 'HijriAdjustmentUpdateRequest',
  '2': [
    {'1': 'authData', '3': 1, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.AuthData', '10': 'authData'},
    {'1': 'hijriAdjustment', '3': 2, '4': 1, '5': 5, '10': 'hijriAdjustment'},
  ],
};

/// Descriptor for `HijriAdjustmentUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hijriAdjustmentUpdateRequestDescriptor = $convert.base64Decode(
    'ChxIaWpyaUFkanVzdG1lbnRVcGRhdGVSZXF1ZXN0EkUKCGF1dGhEYXRhGAEgASgLMikuY29tLm'
    '11amVlYi5tb3NxdWVkYXNoYm9hcmQuZ3JwYy5BdXRoRGF0YVIIYXV0aERhdGESKAoPaGlqcmlB'
    'ZGp1c3RtZW50GAIgASgFUg9oaWpyaUFkanVzdG1lbnQ=');

@$core.Deprecated('Use screenSaverStateUpdateRequestDescriptor instead')
const ScreenSaverStateUpdateRequest$json = {
  '1': 'ScreenSaverStateUpdateRequest',
  '2': [
    {'1': 'authData', '3': 1, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.AuthData', '10': 'authData'},
    {'1': 'isOn', '3': 2, '4': 1, '5': 8, '10': 'isOn'},
  ],
};

/// Descriptor for `ScreenSaverStateUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List screenSaverStateUpdateRequestDescriptor = $convert.base64Decode(
    'Ch1TY3JlZW5TYXZlclN0YXRlVXBkYXRlUmVxdWVzdBJFCghhdXRoRGF0YRgBIAEoCzIpLmNvbS'
    '5tdWplZWIubW9zcXVlZGFzaGJvYXJkLmdycGMuQXV0aERhdGFSCGF1dGhEYXRhEhIKBGlzT24Y'
    'AiABKAhSBGlzT24=');

@$core.Deprecated('Use stringContainerDescriptor instead')
const StringContainer$json = {
  '1': 'StringContainer',
  '2': [
    {'1': 'authData', '3': 1, '4': 1, '5': 11, '6': '.com.mujeeb.mosquedashboard.grpc.AuthData', '10': 'authData'},
    {'1': 'str', '3': 2, '4': 1, '5': 9, '10': 'str'},
  ],
};

/// Descriptor for `StringContainer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringContainerDescriptor = $convert.base64Decode(
    'Cg9TdHJpbmdDb250YWluZXISRQoIYXV0aERhdGEYASABKAsyKS5jb20ubXVqZWViLm1vc3F1ZW'
    'Rhc2hib2FyZC5ncnBjLkF1dGhEYXRhUghhdXRoRGF0YRIQCgNzdHIYAiABKAlSA3N0cg==');

@$core.Deprecated('Use authDataDescriptor instead')
const AuthData$json = {
  '1': 'AuthData',
  '2': [
    {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authDataDescriptor = $convert.base64Decode(
    'CghBdXRoRGF0YRIaCgh1c2VyTmFtZRgBIAEoCVIIdXNlck5hbWUSGgoIcGFzc3dvcmQYAiABKA'
    'lSCHBhc3N3b3Jk');

@$core.Deprecated('Use genericReplyDescriptor instead')
const GenericReply$json = {
  '1': 'GenericReply',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'responseCode', '3': 2, '4': 1, '5': 5, '10': 'responseCode'},
  ],
};

/// Descriptor for `GenericReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericReplyDescriptor = $convert.base64Decode(
    'CgxHZW5lcmljUmVwbHkSIAoLZGVzY3JpcHRpb24YASABKAlSC2Rlc2NyaXB0aW9uEiIKDHJlc3'
    'BvbnNlQ29kZRgCIAEoBVIMcmVzcG9uc2VDb2Rl');

@$core.Deprecated('Use emptyRequestDescriptor instead')
const EmptyRequest$json = {
  '1': 'EmptyRequest',
};

/// Descriptor for `EmptyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyRequestDescriptor = $convert.base64Decode(
    'CgxFbXB0eVJlcXVlc3Q=');

