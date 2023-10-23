//
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'account_id', '3': 2, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'user_agent', '3': 3, '4': 1, '5': 9, '10': 'userAgent'},
    {'1': 'client_ip', '3': 4, '4': 1, '5': 9, '10': 'clientIp'},
    {'1': 'is_blocked', '3': 5, '4': 1, '5': 8, '10': 'isBlocked'},
    {'1': 'expires_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'expiresAt'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'createdAt'},
    {'1': 'refresh_token', '3': 7, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
  '7': {},
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEg4KAmlkGAEgASgJUgJpZBIdCgphY2NvdW50X2lkGAIgASgEUglhY2NvdW50SW'
    'QSHQoKdXNlcl9hZ2VudBgDIAEoCVIJdXNlckFnZW50EhsKCWNsaWVudF9pcBgEIAEoCVIIY2xp'
    'ZW50SXASHQoKaXNfYmxvY2tlZBgFIAEoCFIJaXNCbG9ja2VkElYKCmV4cGlyZXNfYXQYBiABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQhuSQRhKFiIxOTkwLTEwLTA1VDAwOjAwOjAw'
    'WiJSCWV4cGlyZXNBdBJWCgpjcmVhdGVkX2F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcEIbkkEYShYiMTk5MC0xMC0wNVQwMDowMDowMFoiUgljcmVhdGVkQXQSIwoNcmVmcmVz'
    'aF90b2tlbhgHIAEoCVIMcmVmcmVzaFRva2VuOp0EkkGZBAoJKgdTZXNzaW9uMosEeyJpZCI6IC'
    'IxIiwiYWNjb3VudF9pZCI6ICIxIiwgInJlZnJlc2hfdG9rZW4iOiAidjQucHVibGljLmV5Smxi'
    'V0ZwYkNJNkltRXlRR0l1WkdVaUxDSmxlSEFpT2lJeU1ESXpMVEV3TFRBMlZEQXhPakF5T2pBNU'
    't6QXlPakF3SWl3aWFXRjBJam9pTWpBeU15MHhNQzB3TlZRd01Ub3dNam93T1Nzd01qb3dNQ0lz'
    'SW1sa0lqb2lOV1V4WkRZM1pHRXROMk01WWkwME16WTFMV0UwWkRVdE0yTmpNR0V3TlRFeU5ERm'
    'xJaXdpYm1KbUlqb2lNakF5TXkweE1DMHdOVlF3TVRvd01qb3dPU3N3TWpvd01DSjlCb1gzNncw'
    'cG8xdnZIU2pzQlBfS1dlRnhWMXhSYlFheXFiSnVJb0syaktxeTFCdDJSb0h5SmJMb0NFTzE1Q1'
    'JUNURuUTZQMEFIbEJ6anNYdDYxYUREdyIsICJleHBpcmVzX2F0IjogIjIwMjMtMTAtMDVUMDI6'
    'MzA6NTNaIiwgImNyZWF0ZWRfYXQiOiAiMjAyMy0xMC0wNVQwMToyMDoxMVoiLCAiY2xpZW50X2'
    'lwIjogIjEwLjU2LjAuMTIiLCAidXNlcl9hZ2VudCI6ICJNb3ppbGxhIEZpcmVmb3giLCAiaXNf'
    'YmxvY2tlZCI6IGZhbHNlfQ==');

