//
//  Generated code. Do not modify.
//  source: rpc_resend_verification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resendVerificationRequestDescriptor instead')
const ResendVerificationRequest$json = {
  '1': 'ResendVerificationRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `ResendVerificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendVerificationRequestDescriptor = $convert.base64Decode(
    'ChlSZXNlbmRWZXJpZmljYXRpb25SZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKARSCWFjY291bn'
    'RJZDpDkkFACigqGVJlc2VuZCBWZXJpZmljYXRpb24gRW1haWzSAQphY2NvdW50X2lkMhR7ImFj'
    'Y291bnRfaWQiOiAiMSIgfQ==');

@$core.Deprecated('Use resendVerificationResponseDescriptor instead')
const ResendVerificationResponse$json = {
  '1': 'ResendVerificationResponse',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.pb.Account', '8': {}, '10': 'account'},
  ],
  '7': {},
};

/// Descriptor for `ResendVerificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendVerificationResponseDescriptor = $convert.base64Decode(
    'ChpSZXNlbmRWZXJpZmljYXRpb25SZXNwb25zZRIqCgdhY2NvdW50GAEgASgLMgsucGIuQWNjb3'
    'VudEIDkkEAUgdhY2NvdW50OiCSQR0KGyoZUmVzZW5kIFZlcmlmaWNhdGlvbiBFbWFpbA==');

