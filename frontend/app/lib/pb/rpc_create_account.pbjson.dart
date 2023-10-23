//
//  Generated code. Do not modify.
//  source: rpc_create_account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createAccountRequestDescriptor instead')
const CreateAccountRequest$json = {
  '1': 'CreateAccountRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
  '7': {},
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVBY2NvdW50UmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcm'
    'QYAiABKAlSCHBhc3N3b3JkOoQBkkGAAQo2Kg5DcmVhdGUgQWNjb3VudDIRQ3JlYXRlIGFuIEFj'
    'Y291bnTSAQVlbWFpbNIBCHBhc3N3b3JkMkZ7ImVtYWlsIjogImpvaG4uZG9lQGV4YW1wbGUuY2'
    '9tIiwgInBhc3N3b3JkIjogIk1heVRoZUZvcmNlQmVXaXRoWW91ISJ9');

@$core.Deprecated('Use createAccountResponseDescriptor instead')
const CreateAccountResponse$json = {
  '1': 'CreateAccountResponse',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.pb.Account', '8': {}, '10': 'account'},
  ],
  '7': {},
};

/// Descriptor for `CreateAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVBY2NvdW50UmVzcG9uc2USKgoHYWNjb3VudBgBIAEoCzILLnBiLkFjY291bnRCA5'
    'JBAFIHYWNjb3VudDozkkEwCi4qD0NyZWF0ZWQgQWNjb3VudDIbUmV0dXJucyB0aGUgY3JlYXRl'
    'ZCBBY2NvdW50');

