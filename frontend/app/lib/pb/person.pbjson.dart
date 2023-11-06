//
//  Generated code. Do not modify.
//  source: person.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use personDescriptor instead')
const Person$json = {
  '1': 'Person',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'account_id', '3': 2, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'firstname', '3': 3, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 4, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'street', '3': 5, '4': 1, '5': 9, '10': 'street'},
    {'1': 'city', '3': 6, '4': 1, '5': 9, '10': 'city'},
    {'1': 'zip', '3': 7, '4': 1, '5': 9, '10': 'zip'},
    {'1': 'country', '3': 8, '4': 1, '5': 9, '10': 'country'},
    {'1': 'birthday', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'birthday'},
    {'1': 'creator', '3': 10, '4': 1, '5': 9, '10': 'creator'},
    {'1': 'created', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'created'},
    {'1': 'changer', '3': 12, '4': 1, '5': 9, '10': 'changer'},
    {'1': 'changed', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'changed'},
  ],
  '7': {},
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode(
    'CgZQZXJzb24SDgoCaWQYASABKARSAmlkEh0KCmFjY291bnRfaWQYAiABKARSCWFjY291bnRJZB'
    'IcCglmaXJzdG5hbWUYAyABKAlSCWZpcnN0bmFtZRIaCghsYXN0bmFtZRgEIAEoCVIIbGFzdG5h'
    'bWUSFgoGc3RyZWV0GAUgASgJUgZzdHJlZXQSEgoEY2l0eRgGIAEoCVIEY2l0eRIQCgN6aXAYBy'
    'ABKAlSA3ppcBIYCgdjb3VudHJ5GAggASgJUgdjb3VudHJ5ElMKCGJpcnRoZGF5GAkgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEYShYiMTk5MC0xMC0wNVQwMDowMDowMFoiUg'
    'hiaXJ0aGRheRIYCgdjcmVhdG9yGAogASgJUgdjcmVhdG9yElEKB2NyZWF0ZWQYCyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wQhuSQRhKFiIyMDIzLTEwLTA1VDAwOjAwOjAwWiJSB2'
    'NyZWF0ZWQSGAoHY2hhbmdlchgMIAEoCVIHY2hhbmdlchJRCgdjaGFuZ2VkGA0gASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEYShYiMjAyMy0xMC0wNVQwMDowMDowMFoiUgdjaG'
    'FuZ2VkOrwDkkG4AwoIKgZQZXJzb24yqwN7ImlkIjogIjEiLCJlbWFpbCI6ICJqb2huLmRvZUBl'
    'eGFtcGxlLmNvbSIsICJmaXJzdG5hbWUiOiAiSm9obiIsICJsYXN0bmFtZSI6ICJEb2UiLCAicG'
    'hvbmUiOiAiIiwgInN0cmVldCI6ICJEZWF0aCBTdGFyIDIiLCAiemlwIjogIjA4MTUiLCAiY2l0'
    'eSI6ICJOZXcgWW9yayIsICJjb3VudHJ5IjogIlVTQSIsICJiaXJ0aGRheSI6ICIxOTkwLTEwLT'
    'A1VDAwOjAwOjAwWiIsICJwcml2YWN5X2FjY2VwdGVkIjogZmFsc2UsICJwcml2YWN5X2FjY2Vw'
    'dGVkX2RhdGUiOiAiMDAwMS0wMS0wMVQwMDowMDowMFoiLCAiY3JlYXRvciI6ICJqb2huLmRvZU'
    'BleGFtcGxlLmNvbSIsICJjcmVhdGVkIjogIjIwMjMtMTAtMDVUMDI6MzA6NTNaIiwgImNoYW5n'
    'ZXIiOiAiam9obi5kb2VAZXhhbXBsZS5jb20iLCAiY2hhbmdlZCI6ICIyMDIzLTEwLTA1VDAyOj'
    'MwOjUzWiJ9');

