//
//  Generated code. Do not modify.
//  source: rpc_upload_document.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uploadDocumentRequestDescriptor instead')
const UploadDocumentRequest$json = {
  '1': 'UploadDocumentRequest',
  '2': [
    {'1': 'file', '3': 1, '4': 1, '5': 12, '10': 'file'},
    {'1': 'person_id', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'personId', '17': true},
    {'1': 'mail_id', '3': 3, '4': 1, '5': 4, '9': 1, '10': 'mailId', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_person_id'},
    {'1': '_mail_id'},
  ],
};

/// Descriptor for `UploadDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadDocumentRequestDescriptor = $convert.base64Decode(
    'ChVVcGxvYWREb2N1bWVudFJlcXVlc3QSEgoEZmlsZRgBIAEoDFIEZmlsZRIgCglwZXJzb25faW'
    'QYAiABKARIAFIIcGVyc29uSWSIAQESHAoHbWFpbF9pZBgDIAEoBEgBUgZtYWlsSWSIAQE6XJJB'
    'WQpCKhpVcGxvYWREb2N1bWVudCBbb25seSBIVFRQXTIdVXBsb2FkIGEgRG9jdW1lbnQgW29ubH'
    'kgSFRUUF3SAQRmaWxlMhN7InBlcnNvbl9pZCI6ICIxIiB9QgwKCl9wZXJzb25faWRCCgoIX21h'
    'aWxfaWQ=');

@$core.Deprecated('Use uploadDocumentResponseDescriptor instead')
const UploadDocumentResponse$json = {
  '1': 'UploadDocumentResponse',
  '2': [
    {'1': 'document', '3': 1, '4': 1, '5': 11, '6': '.pb.Document', '10': 'document'},
  ],
  '7': {},
};

/// Descriptor for `UploadDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadDocumentResponseDescriptor = $convert.base64Decode(
    'ChZVcGxvYWREb2N1bWVudFJlc3BvbnNlEigKCGRvY3VtZW50GAEgASgLMgwucGIuRG9jdW1lbn'
    'RSCGRvY3VtZW50Oh6SQRsKGSoXVXBsb2FkRG9jdW1lbnQgUmVzcG9uc2U=');

