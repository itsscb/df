//
//  Generated code. Do not modify.
//  source: rpc_list_sessions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listSessionsRequestDescriptor instead')
const ListSessionsRequest$json = {
  '1': 'ListSessionsRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '8': {}, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `ListSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0U2Vzc2lvbnNSZXF1ZXN0Ei0KCmFjY291bnRfaWQYASABKARCDpJBC0oBMaICBWludD'
    'Y0UglhY2NvdW50SWQ6UpJBTwo3KgxMaXN0U2Vzc2lvbnMyGlJldHVybnMgYSBMaXN0IG9mIEFj'
    'Y291bnRz0gEKYWNjb3VudF9pZDIUeyJhY2NvdW50X2lkIjogIjEiIH0=');

@$core.Deprecated('Use listSessionsResponseDescriptor instead')
const ListSessionsResponse$json = {
  '1': 'ListSessionsResponse',
  '2': [
    {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.pb.Session', '8': {}, '10': 'sessions'},
  ],
  '7': {},
};

/// Descriptor for `ListSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0U2Vzc2lvbnNSZXNwb25zZRIsCghzZXNzaW9ucxgBIAMoCzILLnBiLlNlc3Npb25CA5'
    'JBAFIIc2Vzc2lvbnM6MpJBLwotKhVMaXN0U2Vzc2lvbnMgUmVzcG9uc2UyFFJldHVybnMgdGhl'
    'IFNlc3Npb25z');

