//
//  Generated code. Do not modify.
//  source: rpc_update_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updatePaymentRequestDescriptor instead')
const UpdatePaymentRequest$json = {
  '1': 'UpdatePaymentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'payment_category', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'paymentCategory', '17': true},
    {'1': 'bankname', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'bankname', '17': true},
    {'1': 'IBAN', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'IBAN', '17': true},
    {'1': 'BIC', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'BIC', '17': true},
    {'1': 'paypal_account', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'paypalAccount', '17': true},
    {'1': 'paypal_id', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'paypalId', '17': true},
    {'1': 'payment_system', '3': 8, '4': 1, '5': 9, '9': 6, '10': 'paymentSystem', '17': true},
    {'1': 'type', '3': 9, '4': 1, '5': 9, '9': 7, '10': 'type', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_payment_category'},
    {'1': '_bankname'},
    {'1': '_IBAN'},
    {'1': '_BIC'},
    {'1': '_paypal_account'},
    {'1': '_paypal_id'},
    {'1': '_payment_system'},
    {'1': '_type'},
  ],
};

/// Descriptor for `UpdatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePaymentRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQYXltZW50UmVxdWVzdBIOCgJpZBgBIAEoBFICaWQSLgoQcGF5bWVudF9jYXRlZ2'
    '9yeRgCIAEoCUgAUg9wYXltZW50Q2F0ZWdvcnmIAQESHwoIYmFua25hbWUYAyABKAlIAVIIYmFu'
    'a25hbWWIAQESFwoESUJBThgEIAEoCUgCUgRJQkFOiAEBEhUKA0JJQxgFIAEoCUgDUgNCSUOIAQ'
    'ESKgoOcGF5cGFsX2FjY291bnQYBiABKAlIBFINcGF5cGFsQWNjb3VudIgBARIgCglwYXlwYWxf'
    'aWQYByABKAlIBVIIcGF5cGFsSWSIAQESKgoOcGF5bWVudF9zeXN0ZW0YCCABKAlIBlINcGF5bW'
    'VudFN5c3RlbYgBARIXCgR0eXBlGAkgASgJSAdSBHR5cGWIAQE67wGSQesBCigqDlVwZGF0ZSBQ'
    'YXltZW50MhFVcGRhdGUgYW4gUGF5bWVudNIBAmlkMr4BeyJpZCI6ICIxIiwgInBheW1lbnRfY2'
    'F0ZWdvcnkiOiAiVEJEOiBwYXlwYWwiLCAicGF5cGFsX2FjY291bnQiOiAiam9obi5kb2VAZXhh'
    'bXBsZS5jb20iLCAicGF5cGFsX2lkIjogInRoaXMtaXMtYS1wYXlwYWwtaWQiLCAicGF5bWVudF'
    '9zeXN0ZW0iOiAiVEJEOiBwYXlwYWwgc3lzdGVtIiwgInR5cGUiOiAiVEJEOiBzb21lIHR5cGUi'
    'fUITChFfcGF5bWVudF9jYXRlZ29yeUILCglfYmFua25hbWVCBwoFX0lCQU5CBgoEX0JJQ0IRCg'
    '9fcGF5cGFsX2FjY291bnRCDAoKX3BheXBhbF9pZEIRCg9fcGF5bWVudF9zeXN0ZW1CBwoFX3R5'
    'cGU=');

@$core.Deprecated('Use updatePaymentResponseDescriptor instead')
const UpdatePaymentResponse$json = {
  '1': 'UpdatePaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.pb.Payment', '8': {}, '10': 'payment'},
  ],
  '7': {},
};

/// Descriptor for `UpdatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePaymentResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQYXltZW50UmVzcG9uc2USKgoHcGF5bWVudBgBIAEoCzILLnBiLlBheW1lbnRCA5'
    'JBAFIHcGF5bWVudDozkkEwCi4qD1VwZGF0ZWQgUGF5bWVudDIbUmV0dXJucyB0aGUgdXBkYXRl'
    'ZCBQYXltZW50');

