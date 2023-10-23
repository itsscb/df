//
//  Generated code. Do not modify.
//  source: rpc_create_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createAccountInfoRequestDescriptor instead')
const CreateAccountInfoRequest$json = {
  '1': 'CreateAccountInfoRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'street', '3': 5, '4': 1, '5': 9, '10': 'street'},
    {'1': 'city', '3': 6, '4': 1, '5': 9, '10': 'city'},
    {'1': 'zip', '3': 7, '4': 1, '5': 9, '10': 'zip'},
    {'1': 'country', '3': 8, '4': 1, '5': 9, '10': 'country'},
    {'1': 'phone', '3': 9, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'birthday', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'birthday'},
    {'1': 'privacy_accepted', '3': 11, '4': 1, '5': 8, '8': {}, '9': 0, '10': 'privacyAccepted', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_privacy_accepted'},
  ],
};

/// Descriptor for `CreateAccountInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountInfoRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVBY2NvdW50SW5mb1JlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoBFIJYWNjb3VudE'
    'lkEhwKCWZpcnN0bmFtZRgDIAEoCVIJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAQgASgJUghsYXN0'
    'bmFtZRIWCgZzdHJlZXQYBSABKAlSBnN0cmVldBISCgRjaXR5GAYgASgJUgRjaXR5EhAKA3ppcB'
    'gHIAEoCVIDemlwEhgKB2NvdW50cnkYCCABKAlSB2NvdW50cnkSFAoFcGhvbmUYCSABKAlSBXBo'
    'b25lElMKCGJpcnRoZGF5GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEYSh'
    'YiMTk5MC0xMC0wNVQwMDowMDowMFoiUghiaXJ0aGRheRI5ChBwcml2YWN5X2FjY2VwdGVkGAsg'
    'ASgIQgmSQQZKBHRydWVIAFIPcHJpdmFjeUFjY2VwdGVkiAEBOrICkkGuAgp6KhJDcmVhdGUgQW'
    'Njb3VudEluZm8yFUNyZWF0ZSBhbiBBY2NvdW50SW5mb9IBCmFjY291bnRfaWTSAQlmaXJzdG5h'
    'bWXSAQhsYXN0bmFtZdIBBnN0cmVldNIBBGNpdHnSAQN6aXDSAQdjb3VudHJ50gEIYmlydGhkYX'
    'kyrwF7ImFjY291bnRfaWQiOiAiMSIsICJmaXJzdG5hbWUiOiAiSm9obiIsICJsYXN0bmFtZSI6'
    'ICJEb2UiLCAic3RyZWV0IjogIk1haW4gU3RyZWV0IDEiLCAiemlwIjogIjA4MTUiLCAiY2l0eS'
    'I6ICJOZXcgWW9yayIsICJjb3VudHJ5IjogIlVTQSIsICJiaXJ0aGRheSI6ICIxOTkwLTEwLTA1'
    'VDAwOjAwOjAwWiJ9QhMKEV9wcml2YWN5X2FjY2VwdGVk');

@$core.Deprecated('Use createAccountInfoResponseDescriptor instead')
const CreateAccountInfoResponse$json = {
  '1': 'CreateAccountInfoResponse',
  '2': [
    {'1': 'account_info', '3': 1, '4': 1, '5': 11, '6': '.pb.AccountInfo', '8': {}, '10': 'accountInfo'},
  ],
  '7': {},
};

/// Descriptor for `CreateAccountInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountInfoResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVBY2NvdW50SW5mb1Jlc3BvbnNlEjcKDGFjY291bnRfaW5mbxgBIAEoCzIPLnBiLk'
    'FjY291bnRJbmZvQgOSQQBSC2FjY291bnRJbmZvOjuSQTgKNioTQ3JlYXRlZCBBY2NvdW50SW5m'
    'bzIfUmV0dXJucyB0aGUgY3JlYXRlZCBBY2NvdW50SW5mbw==');

