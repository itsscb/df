//
//  Generated code. Do not modify.
//  source: rpc_delete_document.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteDocumentRequestDescriptor instead')
const DeleteDocumentRequest$json = {
  '1': 'DeleteDocumentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `DeleteDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDocumentRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVEb2N1bWVudFJlcXVlc3QSDgoCaWQYASABKARSAmlkOjuSQTgKKSoPRGVsZXRlIE'
    'RvY3VtZW50MhFEZWxldGUgYSBEb2N1bWVudNIBAmlkMgt7ImlkIjogIjEifQ==');

@$core.Deprecated('Use deleteDocumentResponseDescriptor instead')
const DeleteDocumentResponse$json = {
  '1': 'DeleteDocumentResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'deleted', '3': 2, '4': 1, '5': 8, '10': 'deleted'},
  ],
  '7': {},
};

/// Descriptor for `DeleteDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDocumentResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVEb2N1bWVudFJlc3BvbnNlEg4KAmlkGAEgASgEUgJpZBIYCgdkZWxldGVkGAIgAS'
    'gIUgdkZWxldGVkOj2SQToKGioYRGVsZXRlIERvY3VtZW50IFJlc3BvbnNlMhx7ImlkIjogIjEi'
    'LCAiZGVsZXRlZCI6IHRydWV9');

