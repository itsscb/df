//
//  Generated code. Do not modify.
//  source: rpc_update_account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateAccountRequestDescriptor instead')
const UpdateAccountRequest$json = {
  '1': 'UpdateAccountRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'email', '17': true},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'password', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_email'},
    {'1': '_password'},
  ],
};

/// Descriptor for `UpdateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVBY2NvdW50UmVxdWVzdBIdCgphY2NvdW50X2lkGAEgASgEUglhY2NvdW50SWQSGQ'
    'oFZW1haWwYAiABKAlIAFIFZW1haWyIAQESHwoIcGFzc3dvcmQYAyABKAlIAVIIcGFzc3dvcmSI'
    'AQE6cZJBbgo2Kg5VcGRhdGUgQWNjb3VudDIRVXBkYXRlIGFuIEFjY291bnTSAQVlbWFpbNIBCH'
    'Bhc3N3b3JkMjR7ImFjY291bnRfaWQiOiAiMSIsICJlbWFpbCI6ICJqb2huLmRvZUBleGFtcGxl'
    'LmNvbSJ9QggKBl9lbWFpbEILCglfcGFzc3dvcmQ=');

@$core.Deprecated('Use updateAccountResponseDescriptor instead')
const UpdateAccountResponse$json = {
  '1': 'UpdateAccountResponse',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.pb.Account', '8': {}, '10': 'account'},
  ],
  '7': {},
};

/// Descriptor for `UpdateAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVBY2NvdW50UmVzcG9uc2USKgoHYWNjb3VudBgBIAEoCzILLnBiLkFjY291bnRCA5'
    'JBAFIHYWNjb3VudDozkkEwCi4qD1VwZGF0ZWQgQWNjb3VudDIbUmV0dXJucyB0aGUgdXBkYXRl'
    'ZCBBY2NvdW50');

