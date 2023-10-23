//
//  Generated code. Do not modify.
//  source: rpc_delete_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deletePaymentRequestDescriptor instead')
const DeletePaymentRequest$json = {
  '1': 'DeletePaymentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `DeletePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePaymentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQYXltZW50UmVxdWVzdBIOCgJpZBgBIAEoBFICaWQ6OZJBNgonKg5EZWxldGUgUG'
    'F5bWVudDIQRGVsZXRlIGEgUGF5bWVudNIBAmlkMgt7ImlkIjogIjEifQ==');

@$core.Deprecated('Use deletePaymentResponseDescriptor instead')
const DeletePaymentResponse$json = {
  '1': 'DeletePaymentResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'deleted', '3': 2, '4': 1, '5': 8, '10': 'deleted'},
  ],
  '7': {},
};

/// Descriptor for `DeletePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePaymentResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVQYXltZW50UmVzcG9uc2USDgoCaWQYASABKARSAmlkEhgKB2RlbGV0ZWQYAiABKA'
    'hSB2RlbGV0ZWQ6PJJBOQoZKhdEZWxldGUgUGF5bWVudCBSZXNwb25zZTIceyJpZCI6ICIxIiwg'
    'ImRlbGV0ZWQiOiB0cnVlfQ==');

