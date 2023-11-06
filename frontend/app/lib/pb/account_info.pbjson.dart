//
//  Generated code. Do not modify.
//  source: account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use accountInfoDescriptor instead')
const AccountInfo$json = {
  '1': 'AccountInfo',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'street', '3': 5, '4': 1, '5': 9, '10': 'street'},
    {'1': 'city', '3': 6, '4': 1, '5': 9, '10': 'city'},
    {'1': 'zip', '3': 7, '4': 1, '5': 9, '10': 'zip'},
    {'1': 'country', '3': 8, '4': 1, '5': 9, '10': 'country'},
    {'1': 'birthday', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'birthday'},
    {'1': 'phone', '3': 10, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'privacy_accepted', '3': 11, '4': 1, '5': 8, '10': 'privacyAccepted'},
    {'1': 'privacy_accepted_date', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'privacyAcceptedDate'},
    {'1': 'permission_level', '3': 13, '4': 1, '5': 5, '8': {}, '10': 'permissionLevel'},
    {'1': 'creator', '3': 14, '4': 1, '5': 9, '10': 'creator'},
    {'1': 'created', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'created'},
    {'1': 'changer', '3': 16, '4': 1, '5': 9, '10': 'changer'},
    {'1': 'changed', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'changed'},
  ],
  '7': {},
};

/// Descriptor for `AccountInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountInfoDescriptor = $convert.base64Decode(
    'CgtBY2NvdW50SW5mbxIdCgphY2NvdW50X2lkGAEgASgEUglhY2NvdW50SWQSHAoJZmlyc3RuYW'
    '1lGAMgASgJUglmaXJzdG5hbWUSGgoIbGFzdG5hbWUYBCABKAlSCGxhc3RuYW1lEhYKBnN0cmVl'
    'dBgFIAEoCVIGc3RyZWV0EhIKBGNpdHkYBiABKAlSBGNpdHkSEAoDemlwGAcgASgJUgN6aXASGA'
    'oHY291bnRyeRgIIAEoCVIHY291bnRyeRJTCghiaXJ0aGRheRgJIAEoCzIaLmdvb2dsZS5wcm90'
    'b2J1Zi5UaW1lc3RhbXBCG5JBGEoWIjE5OTAtMTAtMDVUMDA6MDA6MDBaIlIIYmlydGhkYXkSFA'
    'oFcGhvbmUYCiABKAlSBXBob25lEikKEHByaXZhY3lfYWNjZXB0ZWQYCyABKAhSD3ByaXZhY3lB'
    'Y2NlcHRlZBJrChVwcml2YWN5X2FjY2VwdGVkX2RhdGUYDCABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wQhuSQRhKFiIyMDIzLTEwLTA1VDAwOjAwOjAwWiJSE3ByaXZhY3lBY2NlcHRl'
    'ZERhdGUSTgoQcGVybWlzc2lvbl9sZXZlbBgNIAEoBUIjkkEgMh5EZWZhdWx0IGlzIDAgKG5vbi'
    '1wcml2aWxlZGdlZClSD3Blcm1pc3Npb25MZXZlbBIYCgdjcmVhdG9yGA4gASgJUgdjcmVhdG9y'
    'ElEKB2NyZWF0ZWQYDyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQhuSQRhKFiIyMD'
    'IzLTEwLTA1VDAwOjAwOjAwWiJSB2NyZWF0ZWQSGAoHY2hhbmdlchgQIAEoCVIHY2hhbmdlchJR'
    'CgdjaGFuZ2VkGBEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEYShYiMjAyMy'
    '0xMC0wNVQwMDowMDowMFoiUgdjaGFuZ2VkOqkDkkGlAwoNKgtBY2NvdW50SW5mbzKTA3siYWNj'
    'b3VudF9pZCI6ICIxIiwgImZpcnN0bmFtZSI6ICJKb2huIiwgImxhc3RuYW1lIjogIkRvZSIsIC'
    'JwaG9uZSI6ICIiLCAic3RyZWV0IjogIkRlYXRoIFN0YXIgMiIsICJ6aXAiOiAiMDgxNSIsICJj'
    'aXR5IjogIk5ldyBZb3JrIiwgImNvdW50cnkiOiAiVVNBIiwgImJpcnRoZGF5IjogIjE5OTAtMT'
    'AtMDVUMDA6MDA6MDBaIiwgInByaXZhY3lfYWNjZXB0ZWQiOiBmYWxzZSwgInByaXZhY3lfYWNj'
    'ZXB0ZWRfZGF0ZSI6ICIwMDAxLTAxLTAxVDAwOjAwOjAwWiIsICJjcmVhdG9yIjogImpvaG4uZG'
    '9lQGV4YW1wbGUuY29tIiwgImNyZWF0ZWQiOiAiMjAyMy0xMC0wNVQwMjozMDo1M1oiLCAiY2hh'
    'bmdlciI6ICJqb2huLmRvZUBleGFtcGxlLmNvbSIsICJjaGFuZ2VkIjogIjIwMjMtMTAtMDVUMD'
    'I6MzA6NTNaIn0=');

