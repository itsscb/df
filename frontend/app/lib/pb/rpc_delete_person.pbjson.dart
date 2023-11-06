//
//  Generated code. Do not modify.
//  source: rpc_delete_person.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deletePersonRequestDescriptor instead')
const DeletePersonRequest$json = {
  '1': 'DeletePersonRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `DeletePersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePersonRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVQZXJzb25SZXF1ZXN0Eg4KAmlkGAEgASgEUgJpZDo3kkE0CiUqDURlbGV0ZSBQZX'
    'Jzb24yD0RlbGV0ZSBhIFBlcnNvbtIBAmlkMgt7ImlkIjogIjEifQ==');

@$core.Deprecated('Use deletePersonResponseDescriptor instead')
const DeletePersonResponse$json = {
  '1': 'DeletePersonResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'deleted', '3': 2, '4': 1, '5': 8, '10': 'deleted'},
  ],
  '7': {},
};

/// Descriptor for `DeletePersonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePersonResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVQZXJzb25SZXNwb25zZRIOCgJpZBgBIAEoBFICaWQSGAoHZGVsZXRlZBgCIAEoCF'
    'IHZGVsZXRlZDo7kkE4ChgqFkRlbGV0ZSBQZXJzb24gUmVzcG9uc2UyHHsiaWQiOiAiMSIsICJk'
    'ZWxldGVkIjogdHJ1ZX0=');

