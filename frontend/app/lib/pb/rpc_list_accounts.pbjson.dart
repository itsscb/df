//
//  Generated code. Do not modify.
//  source: rpc_list_accounts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listAccountsRequestDescriptor instead')
const ListAccountsRequest$json = {
  '1': 'ListAccountsRequest',
  '2': [
    {'1': 'page_id', '3': 1, '4': 1, '5': 13, '10': 'pageId'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 13, '10': 'pageSize'},
  ],
  '7': {},
};

/// Descriptor for `ListAccountsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0QWNjb3VudHNSZXF1ZXN0EhcKB3BhZ2VfaWQYASABKA1SBnBhZ2VJZBIbCglwYWdlX3'
    'NpemUYAiABKA1SCHBhZ2VTaXplOmeSQWQKQCoMTGlzdEFjY291bnRzMhpSZXR1cm5zIGEgTGlz'
    'dCBvZiBBY2NvdW50c9IBB3BhZ2VfaWTSAQlwYWdlX3NpemUyIHsicGFnZV9pZCI6IDEsICJwYW'
    'dlX3NpemUiOiAxMCB9');

@$core.Deprecated('Use listAccountsResponseDescriptor instead')
const ListAccountsResponse$json = {
  '1': 'ListAccountsResponse',
  '2': [
    {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.pb.Account', '8': {}, '10': 'accounts'},
  ],
  '7': {},
};

/// Descriptor for `ListAccountsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0QWNjb3VudHNSZXNwb25zZRIsCghhY2NvdW50cxgBIAMoCzILLnBiLkFjY291bnRCA5'
    'JBAFIIYWNjb3VudHM6MZJBLgosKhVMaXN0QWNjb3VudHMgUmVzcG9uc2UyE1JldHVybnMgdGhl'
    'IEFjY291bnQ=');

