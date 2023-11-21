//
//  Generated code. Do not modify.
//  source: rpc_add_email.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addEmailAddressRequestDescriptor instead')
const AddEmailAddressRequest$json = {
  '1': 'AddEmailAddressRequest',
  '2': [
    {'1': 'person_id', '3': 1, '4': 1, '5': 4, '10': 'personId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
  '7': {},
};

/// Descriptor for `AddEmailAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailAddressRequestDescriptor = $convert.base64Decode(
    'ChZBZGRFbWFpbEFkZHJlc3NSZXF1ZXN0EhsKCXBlcnNvbl9pZBgBIAEoBFIIcGVyc29uSWQSFA'
    'oFZW1haWwYAiABKAlSBWVtYWlsOkCSQT0KOyoQQWRkIEVtYWlsQWRkcmVzczITQWRkIGFuIEVt'
    'YWlsQWRkcmVzc9IBCXBlcnNvbl9pZNIBBWVtYWls');

@$core.Deprecated('Use addEmailAddressResponseDescriptor instead')
const AddEmailAddressResponse$json = {
  '1': 'AddEmailAddressResponse',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 11, '6': '.pb.EmailAddress', '8': {}, '10': 'email'},
  ],
  '7': {},
};

/// Descriptor for `AddEmailAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailAddressResponseDescriptor = $convert.base64Decode(
    'ChdBZGRFbWFpbEFkZHJlc3NSZXNwb25zZRIrCgVlbWFpbBgBIAEoCzIQLnBiLkVtYWlsQWRkcm'
    'Vzc0IDkkEAUgVlbWFpbDo5kkE2CjQqEkFkZGVkIEVtYWlsQWRkcmVzczIeUmV0dXJucyB0aGUg'
    'YWRkZWQgRW1haWxBZGRyZXNz');

