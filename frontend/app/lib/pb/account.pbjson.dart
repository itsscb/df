//
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use accountDescriptor instead')
const Account$json = {
  '1': 'Account',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'secret_key', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'secretKey', '17': true},
    {'1': 'email_verified_time', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'emailVerifiedTime'},
    {'1': 'email_verified', '3': 10, '4': 1, '5': 8, '10': 'emailVerified'},
    {'1': 'privacy_accepted_date', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'privacyAcceptedDate'},
    {'1': 'permission_level', '3': 13, '4': 1, '5': 5, '8': {}, '10': 'permissionLevel'},
  ],
  '7': {},
  '8': [
    {'1': '_secret_key'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode(
    'CgdBY2NvdW50Eg4KAmlkGAEgASgEUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSIgoKc2Vjcm'
    'V0X2tleRgDIAEoCUgAUglzZWNyZXRLZXmIAQESZwoTZW1haWxfdmVyaWZpZWRfdGltZRgJIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCG5JBGEoWIjIwMjMtMTAtMDVUMDA6MDA6MD'
    'BaIlIRZW1haWxWZXJpZmllZFRpbWUSJQoOZW1haWxfdmVyaWZpZWQYCiABKAhSDWVtYWlsVmVy'
    'aWZpZWQSawoVcHJpdmFjeV9hY2NlcHRlZF9kYXRlGAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcEIbkkEYShYiMjAyMy0xMC0wNVQwMDowMDowMFoiUhNwcml2YWN5QWNjZXB0ZWRE'
    'YXRlEk4KEHBlcm1pc3Npb25fbGV2ZWwYDSABKAVCI5JBIDIeRGVmYXVsdCBpcyAwIChub24tcH'
    'JpdmlsZWRnZWQpUg9wZXJtaXNzaW9uTGV2ZWw6vQOSQbkDCgkqB0FjY291bnQyqwN7ImlkIjog'
    'IjEiLCJlbWFpbCI6ICJqb2huLmRvZUBleGFtcGxlLmNvbSIsICJmaXJzdG5hbWUiOiAiSm9obi'
    'IsICJsYXN0bmFtZSI6ICJEb2UiLCAicGhvbmUiOiAiIiwgInN0cmVldCI6ICJEZWF0aCBTdGFy'
    'IDIiLCAiemlwIjogIjA4MTUiLCAiY2l0eSI6ICJOZXcgWW9yayIsICJjb3VudHJ5IjogIlVTQS'
    'IsICJiaXJ0aGRheSI6ICIxOTkwLTEwLTA1VDAwOjAwOjAwWiIsICJwcml2YWN5X2FjY2VwdGVk'
    'IjogZmFsc2UsICJwcml2YWN5X2FjY2VwdGVkX2RhdGUiOiAiMDAwMS0wMS0wMVQwMDowMDowMF'
    'oiLCAiY3JlYXRvciI6ICJqb2huLmRvZUBleGFtcGxlLmNvbSIsICJjcmVhdGVkIjogIjIwMjMt'
    'MTAtMDVUMDI6MzA6NTNaIiwgImNoYW5nZXIiOiAiam9obi5kb2VAZXhhbXBsZS5jb20iLCAiY2'
    'hhbmdlZCI6ICIyMDIzLTEwLTA1VDAyOjMwOjUzWiJ9Qg0KC19zZWNyZXRfa2V5');

