//
//  Generated code. Do not modify.
//  source: rpc_get_person.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getPersonRequestDescriptor instead')
const GetPersonRequest$json = {
  '1': 'GetPersonRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `GetPersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPersonRequestDescriptor = $convert.base64Decode(
    'ChBHZXRQZXJzb25SZXF1ZXN0Eg4KAmlkGAEgASgEUgJpZDo4kkE1CiUqCUdldFBlcnNvbjITR2'
    'V0IGFuIFBlcnNvbiBieSBJRNIBAmlkMgx7ImlkIjogIjEiIH0=');

@$core.Deprecated('Use getPersonResponseDescriptor instead')
const GetPersonResponse$json = {
  '1': 'GetPersonResponse',
  '2': [
    {'1': 'person', '3': 1, '4': 1, '5': 11, '6': '.pb.Person', '8': {}, '10': 'person'},
  ],
  '7': {},
};

/// Descriptor for `GetPersonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPersonResponseDescriptor = $convert.base64Decode(
    'ChFHZXRQZXJzb25SZXNwb25zZRInCgZwZXJzb24YASABKAsyCi5wYi5QZXJzb25CA5JBAFIGcG'
    'Vyc29uOi2SQSoKKCoSR2V0UGVyc29uIFJlc3BvbnNlMhJSZXR1cm5zIHRoZSBQZXJzb24=');

