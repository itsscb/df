//
//  Generated code. Do not modify.
//  source: rpc_list_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listAccountInfoRequestDescriptor instead')
const ListAccountInfoRequest$json = {
  '1': 'ListAccountInfoRequest',
  '2': [
    {'1': 'page_id', '3': 1, '4': 1, '5': 13, '10': 'pageId'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 13, '10': 'pageSize'},
  ],
  '7': {},
};

/// Descriptor for `ListAccountInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountInfoRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0QWNjb3VudEluZm9SZXF1ZXN0EhcKB3BhZ2VfaWQYASABKA1SBnBhZ2VJZBIbCglwYW'
    'dlX3NpemUYAiABKA1SCHBhZ2VTaXplOmqSQWcKQyoPTGlzdEFjY291bnRJbmZvMhpSZXR1cm5z'
    'IGEgTGlzdCBvZiBBY2NvdW50c9IBB3BhZ2VfaWTSAQlwYWdlX3NpemUyIHsicGFnZV9pZCI6ID'
    'EsICJwYWdlX3NpemUiOiAxMCB9');

@$core.Deprecated('Use listAccountInfoResponseDescriptor instead')
const ListAccountInfoResponse$json = {
  '1': 'ListAccountInfoResponse',
  '2': [
    {'1': 'account_info', '3': 1, '4': 3, '5': 11, '6': '.pb.AccountInfo', '8': {}, '10': 'accountInfo'},
  ],
  '7': {},
};

/// Descriptor for `ListAccountInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountInfoResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0QWNjb3VudEluZm9SZXNwb25zZRI3CgxhY2NvdW50X2luZm8YASADKAsyDy5wYi5BY2'
    'NvdW50SW5mb0IDkkEAUgthY2NvdW50SW5mbzo4kkE1CjMqGExpc3RBY2NvdW50SW5mbyBSZXNw'
    'b25zZTIXUmV0dXJucyB0aGUgQWNjb3VudEluZm8=');

