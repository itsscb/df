//
//  Generated code. Do not modify.
//  source: rpc_get_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getPaymentRequestDescriptor instead')
const GetPaymentRequest$json = {
  '1': 'GetPaymentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
  '7': {},
};

/// Descriptor for `GetPaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQYXltZW50UmVxdWVzdBIOCgJpZBgBIAEoBFICaWQ6OpJBNwonKgpHZXRQYXltZW50Mh'
    'RHZXQgYW4gUGF5bWVudCBieSBJRNIBAmlkMgx7ImlkIjogIjEiIH0=');

@$core.Deprecated('Use getPaymentResponseDescriptor instead')
const GetPaymentResponse$json = {
  '1': 'GetPaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.pb.Payment', '8': {}, '10': 'payment'},
  ],
  '7': {},
};

/// Descriptor for `GetPaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQYXltZW50UmVzcG9uc2USKgoHcGF5bWVudBgBIAEoCzILLnBiLlBheW1lbnRCA5JBAF'
    'IHcGF5bWVudDovkkEsCioqE0dldFBheW1lbnQgUmVzcG9uc2UyE1JldHVybnMgdGhlIFBheW1l'
    'bnQ=');

