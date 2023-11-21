//
//  Generated code. Do not modify.
//  source: rpc_add_emails.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addEmailAddressesRequestDescriptor instead')
const AddEmailAddressesRequest$json = {
  '1': 'AddEmailAddressesRequest',
  '2': [
    {'1': 'person_id', '3': 1, '4': 1, '5': 4, '10': 'personId'},
    {'1': 'email', '3': 2, '4': 3, '5': 9, '10': 'email'},
  ],
  '7': {},
};

/// Descriptor for `AddEmailAddressesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailAddressesRequestDescriptor = $convert.base64Decode(
    'ChhBZGRFbWFpbEFkZHJlc3Nlc1JlcXVlc3QSGwoJcGVyc29uX2lkGAEgASgEUghwZXJzb25JZB'
    'IUCgVlbWFpbBgCIAMoCVIFZW1haWw6QJJBPQo7KhBBZGQgRW1haWxBZGRyZXNzMhNBZGQgYW4g'
    'RW1haWxBZGRyZXNz0gEJcGVyc29uX2lk0gEFZW1haWw=');

@$core.Deprecated('Use addEmailAddressesResponseDescriptor instead')
const AddEmailAddressesResponse$json = {
  '1': 'AddEmailAddressesResponse',
  '2': [
    {'1': 'emails', '3': 1, '4': 3, '5': 11, '6': '.pb.EmailAddress', '8': {}, '10': 'emails'},
  ],
  '7': {},
};

/// Descriptor for `AddEmailAddressesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailAddressesResponseDescriptor = $convert.base64Decode(
    'ChlBZGRFbWFpbEFkZHJlc3Nlc1Jlc3BvbnNlEi0KBmVtYWlscxgBIAMoCzIQLnBiLkVtYWlsQW'
    'RkcmVzc0IDkkEAUgZlbWFpbHM6PZJBOgo4KhRBZGRlZCBFbWFpbEFkZHJlc3NlczIgUmV0dXJu'
    'cyB0aGUgYWRkZWQgRW1haWxBZGRyZXNzZXM=');

