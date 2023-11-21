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
    {'1': 'account_level', '3': 4, '4': 1, '5': 13, '9': 1, '10': 'accountLevel', '17': true},
    {'1': 'email_verified_time', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'emailVerifiedTime'},
    {'1': 'email_verified', '3': 10, '4': 1, '5': 8, '10': 'emailVerified'},
    {'1': 'privacy_accepted_date', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'privacyAcceptedDate'},
    {'1': 'permission_level', '3': 13, '4': 1, '5': 5, '8': {}, '10': 'permissionLevel'},
  ],
  '7': {},
  '8': [
    {'1': '_secret_key'},
    {'1': '_account_level'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode(
    'CgdBY2NvdW50Eg4KAmlkGAEgASgEUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSIgoKc2Vjcm'
    'V0X2tleRgDIAEoCUgAUglzZWNyZXRLZXmIAQESKAoNYWNjb3VudF9sZXZlbBgEIAEoDUgBUgxh'
    'Y2NvdW50TGV2ZWyIAQESZwoTZW1haWxfdmVyaWZpZWRfdGltZRgJIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBCG5JBGEoWIjIwMjMtMTAtMDVUMDA6MDA6MDBaIlIRZW1haWxWZXJp'
    'ZmllZFRpbWUSJQoOZW1haWxfdmVyaWZpZWQYCiABKAhSDWVtYWlsVmVyaWZpZWQSawoVcHJpdm'
    'FjeV9hY2NlcHRlZF9kYXRlGAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEY'
    'ShYiMjAyMy0xMC0wNVQwMDowMDowMFoiUhNwcml2YWN5QWNjZXB0ZWREYXRlEk4KEHBlcm1pc3'
    'Npb25fbGV2ZWwYDSABKAVCI5JBIDIeRGVmYXVsdCBpcyAwIChub24tcHJpdmlsZWRnZWQpUg9w'
    'ZXJtaXNzaW9uTGV2ZWw6vQOSQbkDCgkqB0FjY291bnQyqwN7ImlkIjogIjEiLCJlbWFpbCI6IC'
    'Jqb2huLmRvZUBleGFtcGxlLmNvbSIsICJmaXJzdG5hbWUiOiAiSm9obiIsICJsYXN0bmFtZSI6'
    'ICJEb2UiLCAicGhvbmUiOiAiIiwgInN0cmVldCI6ICJEZWF0aCBTdGFyIDIiLCAiemlwIjogIj'
    'A4MTUiLCAiY2l0eSI6ICJOZXcgWW9yayIsICJjb3VudHJ5IjogIlVTQSIsICJiaXJ0aGRheSI6'
    'ICIxOTkwLTEwLTA1VDAwOjAwOjAwWiIsICJwcml2YWN5X2FjY2VwdGVkIjogZmFsc2UsICJwcm'
    'l2YWN5X2FjY2VwdGVkX2RhdGUiOiAiMDAwMS0wMS0wMVQwMDowMDowMFoiLCAiY3JlYXRvciI6'
    'ICJqb2huLmRvZUBleGFtcGxlLmNvbSIsICJjcmVhdGVkIjogIjIwMjMtMTAtMDVUMDI6MzA6NT'
    'NaIiwgImNoYW5nZXIiOiAiam9obi5kb2VAZXhhbXBsZS5jb20iLCAiY2hhbmdlZCI6ICIyMDIz'
    'LTEwLTA1VDAyOjMwOjUzWiJ9Qg0KC19zZWNyZXRfa2V5QhAKDl9hY2NvdW50X2xldmVs');

