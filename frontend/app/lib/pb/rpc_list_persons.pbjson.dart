//
//  Generated code. Do not modify.
//  source: rpc_list_persons.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listPersonsRequestDescriptor instead')
const ListPersonsRequest$json = {
  '1': 'ListPersonsRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `ListPersonsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPersonsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UGVyc29uc1JlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoBFIJYWNjb3VudElkOk6SQU'
    'sKNSoLTGlzdFBlcnNvbnMyGVJldHVybnMgYSBMaXN0IG9mIFBlcnNvbnPSAQphY2NvdW50X2lk'
    'MhJ7ImFjY291bnRfaWQiOiAxIH0=');

@$core.Deprecated('Use listPersonsResponseDescriptor instead')
const ListPersonsResponse$json = {
  '1': 'ListPersonsResponse',
  '2': [
    {'1': 'persons', '3': 1, '4': 3, '5': 11, '6': '.pb.Person', '8': {}, '10': 'persons'},
  ],
  '7': {},
};

/// Descriptor for `ListPersonsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPersonsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UGVyc29uc1Jlc3BvbnNlEikKB3BlcnNvbnMYASADKAsyCi5wYi5QZXJzb25CA5JBAF'
    'IHcGVyc29uczovkkEsCioqFExpc3RQZXJzb25zIFJlc3BvbnNlMhJSZXR1cm5zIHRoZSBQZXJz'
    'b24=');

