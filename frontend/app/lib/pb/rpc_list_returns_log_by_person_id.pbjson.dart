//
//  Generated code. Do not modify.
//  source: rpc_list_returns_log_by_person_id.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listReturnsLogRequestDescriptor instead')
const ListReturnsLogRequest$json = {
  '1': 'ListReturnsLogRequest',
  '2': [
    {'1': 'person_id', '3': 1, '4': 1, '5': 4, '10': 'personId'},
  ],
  '7': {},
};

/// Descriptor for `ListReturnsLogRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReturnsLogRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0UmV0dXJuc0xvZ1JlcXVlc3QSGwoJcGVyc29uX2lkGAEgASgEUghwZXJzb25JZDpSkk'
    'FPCjoqDkxpc3RSZXR1cm5zTG9nMhxSZXR1cm5zIGEgTGlzdCBvZiBSZXR1cm5zTG9n0gEJcGVy'
    'c29uX2lkMhF7InBlcnNvbl9pZCI6IDEgfQ==');

@$core.Deprecated('Use listReturnsLogResponseDescriptor instead')
const ListReturnsLogResponse$json = {
  '1': 'ListReturnsLogResponse',
  '2': [
    {'1': 'returns_log', '3': 1, '4': 3, '5': 11, '6': '.pb.ReturnsLog', '8': {}, '10': 'returnsLog'},
  ],
  '7': {},
};

/// Descriptor for `ListReturnsLogResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReturnsLogResponseDescriptor = $convert.base64Decode(
    'ChZMaXN0UmV0dXJuc0xvZ1Jlc3BvbnNlEjQKC3JldHVybnNfbG9nGAEgAygLMg4ucGIuUmV0dX'
    'Juc0xvZ0IDkkEAUgpyZXR1cm5zTG9nOjaSQTMKMSoXTGlzdFJldHVybnNMb2cgUmVzcG9uc2Uy'
    'FlJldHVybnMgdGhlIFJldHVybnNMb2c=');

