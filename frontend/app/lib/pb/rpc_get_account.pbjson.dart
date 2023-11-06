//
//  Generated code. Do not modify.
//  source: rpc_get_account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getAccountRequestDescriptor instead')
const GetAccountRequest$json = {
  '1': 'GetAccountRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `GetAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountRequestDescriptor = $convert.base64Decode(
    'ChFHZXRBY2NvdW50UmVxdWVzdBIOCgJpZBgBIAEoBFICaWQ6Q5JBQAowKgpHZXRBY2NvdW50Mh'
    '1HZXQgQWNjb3VudEluZm8gYnkgYWNjb3VudF9pZNIBAmlkMgx7ImlkIjogIjEiIH0=');

@$core.Deprecated('Use getAccountResponseDescriptor instead')
const GetAccountResponse$json = {
  '1': 'GetAccountResponse',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.pb.Account', '8': {}, '10': 'account'},
  ],
  '7': {},
};

/// Descriptor for `GetAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountResponseDescriptor = $convert.base64Decode(
    'ChJHZXRBY2NvdW50UmVzcG9uc2USKgoHYWNjb3VudBgBIAEoCzILLnBiLkFjY291bnRCA5JBAF'
    'IHYWNjb3VudDozkkEwCi4qE0dldEFjY291bnQgUmVzcG9uc2UyF1JldHVybnMgdGhlIEFjY291'
    'bnRJbmZv');

