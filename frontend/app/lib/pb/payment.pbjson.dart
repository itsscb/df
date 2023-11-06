//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = {
  '1': 'Payment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'account_id', '3': 2, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'payment_category', '3': 3, '4': 1, '5': 9, '10': 'paymentCategory'},
    {'1': 'bankname', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'bankname', '17': true},
    {'1': 'IBAN', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'IBAN', '17': true},
    {'1': 'BIC', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'BIC', '17': true},
    {'1': 'paypal_account', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'paypalAccount', '17': true},
    {'1': 'paypal_id', '3': 8, '4': 1, '5': 9, '9': 4, '10': 'paypalId', '17': true},
    {'1': 'payment_system', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'paymentSystem', '17': true},
    {'1': 'type', '3': 10, '4': 1, '5': 9, '10': 'type'},
    {'1': 'creator', '3': 11, '4': 1, '5': 9, '10': 'creator'},
    {'1': 'created', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'created'},
    {'1': 'changer', '3': 13, '4': 1, '5': 9, '10': 'changer'},
    {'1': 'changed', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'changed'},
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

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50Eg4KAmlkGAEgASgEUgJpZBIdCgphY2NvdW50X2lkGAIgASgEUglhY2NvdW50SW'
    'QSKQoQcGF5bWVudF9jYXRlZ29yeRgDIAEoCVIPcGF5bWVudENhdGVnb3J5Eh8KCGJhbmtuYW1l'
    'GAQgASgJSABSCGJhbmtuYW1liAEBEhcKBElCQU4YBSABKAlIAVIESUJBTogBARIVCgNCSUMYBi'
    'ABKAlIAlIDQklDiAEBEioKDnBheXBhbF9hY2NvdW50GAcgASgJSANSDXBheXBhbEFjY291bnSI'
    'AQESIAoJcGF5cGFsX2lkGAggASgJSARSCHBheXBhbElkiAEBEioKDnBheW1lbnRfc3lzdGVtGA'
    'kgASgJSAVSDXBheW1lbnRTeXN0ZW2IAQESEgoEdHlwZRgKIAEoCVIEdHlwZRIYCgdjcmVhdG9y'
    'GAsgASgJUgdjcmVhdG9yElEKB2NyZWF0ZWQYDCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
    'N0YW1wQhuSQRhKFiIyMDIzLTEwLTA1VDAwOjAwOjAwWiJSB2NyZWF0ZWQSGAoHY2hhbmdlchgN'
    'IAEoCVIHY2hhbmdlchJRCgdjaGFuZ2VkGA4gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcEIbkkEYShYiMjAyMy0xMC0wNVQwMDowMDowMFoiUgdjaGFuZ2VkOu4CkkHqAgoJKgdQYXlt'
    'ZW50MtwCeyJpZCI6ICIxIiwiYWNjb3VudF9pZCI6ICIxIiwgInBheW1lbnRfY2F0ZWdvcnkiOi'
    'AiVEJEOiBwYXlwYWwiLCAicGF5cGFsX2FjY291bnQiOiAiam9obi5kb2VAZXhhbXBsZS5jb20i'
    'LCAicGF5cGFsX2lkIjogInRoaXMtaXMtYS1wYXlwYWwtaWQiLCAicGF5bWVudF9zeXN0ZW0iOi'
    'AiVEJEOiBwYXlwYWwgc3lzdGVtIiwgInR5cGUiOiAiVEJEOiBzb21lIHR5cGUiLCAiY3JlYXRv'
    'ciI6ICJqb2huLmRvZUBleGFtcGxlLmNvbSIsICJjcmVhdGVkIjogIjIwMjMtMTAtMDVUMDI6Mz'
    'A6NTNaIiwgImNoYW5nZXIiOiAiam9obi5kb2VAZXhhbXBsZS5jb20iLCAiY2hhbmdlZCI6ICIy'
    'MDIzLTEwLTA1VDAyOjMwOjUzWiJ9QgsKCV9iYW5rbmFtZUIHCgVfSUJBTkIGCgRfQklDQhEKD1'
    '9wYXlwYWxfYWNjb3VudEIMCgpfcGF5cGFsX2lkQhEKD19wYXltZW50X3N5c3RlbQ==');

