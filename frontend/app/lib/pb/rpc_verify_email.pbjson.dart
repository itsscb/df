//
//  Generated code. Do not modify.
//  source: rpc_verify_email.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use verifyEmailRequestDescriptor instead')
const VerifyEmailRequest$json = {
  '1': 'VerifyEmailRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'secret_key', '3': 2, '4': 1, '5': 9, '10': 'secretKey'},
  ],
  '7': {},
};

/// Descriptor for `VerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailRequestDescriptor = $convert.base64Decode(
    'ChJWZXJpZnlFbWFpbFJlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoBFIJYWNjb3VudElkEh0KCn'
    'NlY3JldF9rZXkYAiABKAlSCXNlY3JldEtleTpckkFZCicqC1ZlcmlmeUVtYWls0gEKYWNjb3Vu'
    'dF9pZNIBCnNlY3JldF9rZXkyLnsiaWQiOiAiMSIsICJzZWNyZXRfa2V5IjogInRoaXNpc2FzZW'
    'NyZXRrZXkiIH0=');

@$core.Deprecated('Use verifyEmailResponseDescriptor instead')
const VerifyEmailResponse$json = {
  '1': 'VerifyEmailResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '8': {}, '10': 'verified'},
  ],
  '7': {},
};

/// Descriptor for `VerifyEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailResponseDescriptor = $convert.base64Decode(
    'ChNWZXJpZnlFbWFpbFJlc3BvbnNlEh8KCHZlcmlmaWVkGAEgASgIQgOSQQBSCHZlcmlmaWVkOh'
    'uSQRgKFioUVmVyaWZ5RW1haWwgUmVzcG9uc2U=');

