//
//  Generated code. Do not modify.
//  source: rpc_create_person.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createPersonRequestDescriptor instead')
const CreatePersonRequest$json = {
  '1': 'CreatePersonRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'firstname', '3': 2, '4': 1, '5': 9, '10': 'firstname'},
    {'1': 'lastname', '3': 3, '4': 1, '5': 9, '10': 'lastname'},
    {'1': 'street', '3': 4, '4': 1, '5': 9, '10': 'street'},
    {'1': 'city', '3': 5, '4': 1, '5': 9, '10': 'city'},
    {'1': 'zip', '3': 6, '4': 1, '5': 9, '10': 'zip'},
    {'1': 'country', '3': 7, '4': 1, '5': 9, '10': 'country'},
    {'1': 'relationship', '3': 8, '4': 1, '5': 9, '10': 'relationship'},
    {'1': 'birthday', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'birthday'},
  ],
  '7': {},
};

/// Descriptor for `CreatePersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPersonRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVQZXJzb25SZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKARSCWFjY291bnRJZBIcCg'
    'lmaXJzdG5hbWUYAiABKAlSCWZpcnN0bmFtZRIaCghsYXN0bmFtZRgDIAEoCVIIbGFzdG5hbWUS'
    'FgoGc3RyZWV0GAQgASgJUgZzdHJlZXQSEgoEY2l0eRgFIAEoCVIEY2l0eRIQCgN6aXAYBiABKA'
    'lSA3ppcBIYCgdjb3VudHJ5GAcgASgJUgdjb3VudHJ5EiIKDHJlbGF0aW9uc2hpcBgIIAEoCVIM'
    'cmVsYXRpb25zaGlwElMKCGJpcnRoZGF5GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcEIbkkEYShYiMTk5MC0xMC0wNVQwMDowMDowMFoiUghiaXJ0aGRheTq4ApJBtAIKfyoNQ3Jl'
    'YXRlIFBlcnNvbjIQQ3JlYXRlIGFuIFBlcnNvbtIBCmFjY291bnRfaWTSAQlmaXJzdG5hbWXSAQ'
    'hsYXN0bmFtZdIBBnN0cmVldNIBBGNpdHnSAQN6aXDSAQdjb3VudHJ50gEMcmVsYXRpb25zaGlw'
    '0gEIYmlydGhkYXkysAF7ICJhY2NvdW50X2lkIjogIjEiLCAiZmlyc3RuYW1lIjogIkpvaG4iLC'
    'AibGFzdG5hbWUiOiAiRG9lIiwgInN0cmVldCI6ICJNYWluIFN0cmVldCAxIiwgInppcCI6ICIw'
    'ODE1IiwgImNpdHkiOiAiTmV3IFlvcmsiLCAiY291bnRyeSI6ICJVU0EiLCAiYmlydGhkYXkiOi'
    'AiMTk5MC0xMC0wNVQwMDowMDowMFoifQ==');

@$core.Deprecated('Use createPersonResponseDescriptor instead')
const CreatePersonResponse$json = {
  '1': 'CreatePersonResponse',
  '2': [
    {'1': 'person', '3': 1, '4': 1, '5': 11, '6': '.pb.Person', '8': {}, '10': 'person'},
  ],
  '7': {},
};

/// Descriptor for `CreatePersonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPersonResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQZXJzb25SZXNwb25zZRInCgZwZXJzb24YASABKAsyCi5wYi5QZXJzb25CA5JBAF'
    'IGcGVyc29uOjGSQS4KLCoOQ3JlYXRlZCBQZXJzb24yGlJldHVybnMgdGhlIGNyZWF0ZWQgUGVy'
    'c29u');

