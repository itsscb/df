//
//  Generated code. Do not modify.
//  source: rpc_update_person.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updatePersonRequestDescriptor instead')
const UpdatePersonRequest$json = {
  '1': 'UpdatePersonRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    {'1': 'firstname', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'firstname', '17': true},
    {'1': 'lastname', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'lastname', '17': true},
    {'1': 'street', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'street', '17': true},
    {'1': 'city', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'city', '17': true},
    {'1': 'zip', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'zip', '17': true},
    {'1': 'country', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'country', '17': true},
    {'1': 'birthday', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '9': 6, '10': 'birthday', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_firstname'},
    {'1': '_lastname'},
    {'1': '_street'},
    {'1': '_city'},
    {'1': '_zip'},
    {'1': '_country'},
    {'1': '_birthday'},
  ],
};

/// Descriptor for `UpdatePersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePersonRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVQZXJzb25SZXF1ZXN0Eg4KAmlkGAEgASgEUgJpZBIhCglmaXJzdG5hbWUYAiABKA'
    'lIAFIJZmlyc3RuYW1liAEBEh8KCGxhc3RuYW1lGAMgASgJSAFSCGxhc3RuYW1liAEBEhsKBnN0'
    'cmVldBgEIAEoCUgCUgZzdHJlZXSIAQESFwoEY2l0eRgFIAEoCUgDUgRjaXR5iAEBEhUKA3ppcB'
    'gGIAEoCUgEUgN6aXCIAQESHQoHY291bnRyeRgHIAEoCUgFUgdjb3VudHJ5iAEBElgKCGJpcnRo'
    'ZGF5GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIbkkEYShYiMTk5MC0xMC0wNV'
    'QwMDowMDowMFoiSAZSCGJpcnRoZGF5iAEBOuUBkkHhAQomKg1VcGRhdGUgUGVyc29uMhBVcGRh'
    'dGUgYW4gUGVyc29u0gECaWQytgF7ImlkIjogIjEiLCAiZmlyc3RuYW1lIjogIkpvaG4iLCAibG'
    'FzdG5hbWUiOiAiRG9lIiwgInBob25lIjogIiIsICJzdHJlZXQiOiAiRGVhdGggU3RhciAzIiwg'
    'InppcCI6ICIwODE2IiwgImNpdHkiOiAiTW9udGFuYSIsICJjb3VudHJ5IjogIkNhbmFkYSIsIC'
    'JiaXJ0aGRheSI6ICIxOTkyLTEwLTA1VDAwOjAwOjAwWiIgfUIMCgpfZmlyc3RuYW1lQgsKCV9s'
    'YXN0bmFtZUIJCgdfc3RyZWV0QgcKBV9jaXR5QgYKBF96aXBCCgoIX2NvdW50cnlCCwoJX2Jpcn'
    'RoZGF5');

@$core.Deprecated('Use updatePersonResponseDescriptor instead')
const UpdatePersonResponse$json = {
  '1': 'UpdatePersonResponse',
  '2': [
    {'1': 'person', '3': 1, '4': 1, '5': 11, '6': '.pb.Person', '8': {}, '10': 'person'},
  ],
  '7': {},
};

/// Descriptor for `UpdatePersonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePersonResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQZXJzb25SZXNwb25zZRInCgZwZXJzb24YASABKAsyCi5wYi5QZXJzb25CA5JBAF'
    'IGcGVyc29uOjGSQS4KLCoOVXBkYXRlZCBQZXJzb24yGlJldHVybnMgdGhlIHVwZGF0ZWQgUGVy'
    'c29u');

