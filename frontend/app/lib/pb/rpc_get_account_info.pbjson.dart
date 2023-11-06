//
//  Generated code. Do not modify.
//  source: rpc_get_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getAccountInfoRequestDescriptor instead')
const GetAccountInfoRequest$json = {
  '1': 'GetAccountInfoRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `GetAccountInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountInfoRequestDescriptor = $convert.base64Decode(
    'ChVHZXRBY2NvdW50SW5mb1JlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoBFIJYWNjb3VudElkOl'
    'eSQVQKPCoOR2V0QWNjb3VudEluZm8yHUdldCBBY2NvdW50SW5mbyBieSBhY2NvdW50X2lk0gEK'
    'YWNjb3VudF9pZDIUeyJhY2NvdW50X2lkIjogIjEiIH0=');

@$core.Deprecated('Use getAccountInfoResponseDescriptor instead')
const GetAccountInfoResponse$json = {
  '1': 'GetAccountInfoResponse',
  '2': [
    {'1': 'account_info', '3': 1, '4': 1, '5': 11, '6': '.pb.AccountInfo', '8': {}, '10': 'accountInfo'},
  ],
  '7': {},
};

/// Descriptor for `GetAccountInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountInfoResponseDescriptor = $convert.base64Decode(
    'ChZHZXRBY2NvdW50SW5mb1Jlc3BvbnNlEjcKDGFjY291bnRfaW5mbxgBIAEoCzIPLnBiLkFjY2'
    '91bnRJbmZvQgOSQQBSC2FjY291bnRJbmZvOjeSQTQKMioXR2V0QWNjb3VudEluZm8gUmVzcG9u'
    'c2UyF1JldHVybnMgdGhlIEFjY291bnRJbmZv');

