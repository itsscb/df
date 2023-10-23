//
//  Generated code. Do not modify.
//  source: rpc_create_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createPaymentRequestDescriptor instead')
const CreatePaymentRequest$json = {
  '1': 'CreatePaymentRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'payment_category', '3': 2, '4': 1, '5': 9, '10': 'paymentCategory'},
    {'1': 'bankname', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'bankname', '17': true},
    {'1': 'IBAN', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'IBAN', '17': true},
    {'1': 'BIC', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'BIC', '17': true},
    {'1': 'paypal_account', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'paypalAccount', '17': true},
    {'1': 'paypal_id', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'paypalId', '17': true},
    {'1': 'payment_system', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'paymentSystem', '17': true},
    {'1': 'type', '3': 9, '4': 1, '5': 9, '10': 'type'},
  ],
  '7': {},
  '8': [
    {'1': '_bankname'},
    {'1': '_IBAN'},
    {'1': '_BIC'},
    {'1': '_paypal_account'},
    {'1': '_paypal_id'},
    {'1': '_payment_system'},
  ],
};

/// Descriptor for `CreatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXltZW50UmVxdWVzdBIdCgphY2NvdW50X2lkGAEgASgEUglhY2NvdW50SWQSKQ'
    'oQcGF5bWVudF9jYXRlZ29yeRgCIAEoCVIPcGF5bWVudENhdGVnb3J5Eh8KCGJhbmtuYW1lGAMg'
    'ASgJSABSCGJhbmtuYW1liAEBEhcKBElCQU4YBCABKAlIAVIESUJBTogBARIVCgNCSUMYBSABKA'
    'lIAlIDQklDiAEBEioKDnBheXBhbF9hY2NvdW50GAYgASgJSANSDXBheXBhbEFjY291bnSIAQES'
    'IAoJcGF5cGFsX2lkGAcgASgJSARSCHBheXBhbElkiAEBEioKDnBheW1lbnRfc3lzdGVtGAggAS'
    'gJSAVSDXBheW1lbnRTeXN0ZW2IAQESEgoEdHlwZRgJIAEoCVIEdHlwZTqZApJBlQIKSioOQ3Jl'
    'YXRlIFBheW1lbnQyEUNyZWF0ZSBhbiBQYXltZW500gEKYWNjb3VudF9pZNIBEHBheW1lbnRfY2'
    'F0ZWdvcnnSAQR0eXBlMsYBeyJhY2NvdW50X2lkIjogIjEiLCAicGF5bWVudF9jYXRlZ29yeSI6'
    'ICJUQkQ6IHBheXBhbCIsICJwYXlwYWxfYWNjb3VudCI6ICJqb2huLmRvZUBleGFtcGxlLmNvbS'
    'IsICJwYXlwYWxfaWQiOiAidGhpcy1pcy1hLXBheXBhbC1pZCIsICJwYXltZW50X3N5c3RlbSI6'
    'ICJUQkQ6IHBheXBhbCBzeXN0ZW0iLCAidHlwZSI6ICJUQkQ6IHNvbWUgdHlwZSJ9QgsKCV9iYW'
    '5rbmFtZUIHCgVfSUJBTkIGCgRfQklDQhEKD19wYXlwYWxfYWNjb3VudEIMCgpfcGF5cGFsX2lk'
    'QhEKD19wYXltZW50X3N5c3RlbQ==');

@$core.Deprecated('Use createPaymentResponseDescriptor instead')
const CreatePaymentResponse$json = {
  '1': 'CreatePaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.pb.Payment', '8': {}, '10': 'payment'},
  ],
  '7': {},
};

/// Descriptor for `CreatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXltZW50UmVzcG9uc2USKgoHcGF5bWVudBgBIAEoCzILLnBiLlBheW1lbnRCA5'
    'JBAFIHcGF5bWVudDozkkEwCi4qD0NyZWF0ZWQgUGF5bWVudDIbUmV0dXJucyB0aGUgY3JlYXRl'
    'ZCBQYXltZW50');

