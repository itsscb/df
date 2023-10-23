//
//  Generated code. Do not modify.
//  source: rpc_block_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use blockSessionRequestDescriptor instead')
const BlockSessionRequest$json = {
  '1': 'BlockSessionRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
  ],
  '7': {},
};

/// Descriptor for `BlockSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockSessionRequestDescriptor = $convert.base64Decode(
    'ChNCbG9ja1Nlc3Npb25SZXF1ZXN0ElEKCnNlc3Npb25faWQYASABKAlCMpJBL0omIjVlMWQ2N2'
    'RhLTdjOWItNDM2NS1hNGQ1LTNjYzBhMDUxMjQxZSKiAgR1dWlkUglzZXNzaW9uSWQ6apJBZwot'
    'Kg1CbG9jayBTZXNzaW9uMg9CbG9jayBhIFNlc3Npb27SAQpzZXNzaW9uX2lkMjZ7InNlc3Npb2'
    '5faWQiOiAiNWUxZDY3ZGEtN2M5Yi00MzY1LWE0ZDUtM2NjMGEwNTEyNDFlIn0=');

@$core.Deprecated('Use blockSessionResponseDescriptor instead')
const BlockSessionResponse$json = {
  '1': 'BlockSessionResponse',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
    {'1': 'blocked', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'blocked'},
  ],
  '7': {},
};

/// Descriptor for `BlockSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockSessionResponseDescriptor = $convert.base64Decode(
    'ChRCbG9ja1Nlc3Npb25SZXNwb25zZRJRCgpzZXNzaW9uX2lkGAEgASgJQjKSQS9KJiI1ZTFkNj'
    'dkYS03YzliLTQzNjUtYTRkNS0zY2MwYTA1MTI0MWUiogIEdXVpZFIJc2Vzc2lvbklkEiMKB2Js'
    'b2NrZWQYAiABKAhCCZJBBkoEdHJ1ZVIHYmxvY2tlZDpfkkFcChEqD0Jsb2NrZWQgU2Vzc2lvbj'
    'JHeyJzZXNzaW9uX2lkIjogIjVlMWQ2N2RhLTdjOWItNDM2NS1hNGQ1LTNjYzBhMDUxMjQxZSIs'
    'ICJibG9ja2VkIjogdHJ1ZX0=');

