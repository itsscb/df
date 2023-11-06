//
//  Generated code. Do not modify.
//  source: rpc_login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'password'},
  ],
  '7': {},
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSMQoFZW1haWwYASABKAlCG5JBGEoWImpvaG4uZG9lQGV4YW1wbGUuY2'
    '9tIlIFZW1haWwSQwoIcGFzc3dvcmQYAiABKAlCJ5JBJEoXIk1heVRoZUZvcmNlQmVXaXRoWW91'
    'ISKiAghwYXNzd29yZFIIcGFzc3dvcmQ6eZJBdgosKgVMb2dpbjIQTG9naW4gYW4gQWNjb3VudN'
    'IBBWVtYWls0gEIcGFzc3dvcmQyRnsiZW1haWwiOiAiam9obi5kb2VAZXhhbXBsZS5jb20iLCAi'
    'cGFzc3dvcmQiOiAiTWF5VGhlRm9yY2VCZVdpdGhZb3UhIn0=');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'sessionId'},
    {'1': 'access_token', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'accessToken'},
    {'1': 'access_token_expires_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'refreshToken'},
    {'1': 'refresh_token_expires_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
    {'1': 'account_id', '3': 6, '4': 1, '5': 4, '8': {}, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlElEKCnNlc3Npb25faWQYASABKAlCMpJBL0omIjVlMWQ2N2RhLTdjOW'
    'ItNDM2NS1hNGQ1LTNjYzBhMDUxMjQxZSKiAgR1dWlkUglzZXNzaW9uSWQS6QIKDGFjY2Vzc190'
    'b2tlbhgCIAEoCULFApJBwQJKvgIidjQucHVibGljLmV5SmxiV0ZwYkNJNkltRXlRR0l1WkdVaU'
    'xDSmxlSEFpT2lJeU1ESXpMVEV3TFRBMVZEQXhPakUzT2pBNUt6QXlPakF3SWl3aWFXRjBJam9p'
    'TWpBeU15MHhNQzB3TlZRd01Ub3dNam93T1Nzd01qb3dNQ0lzSW1sa0lqb2laamxoTWpFMk9XUX'
    'RNV1l4WVMwMFlUaGlMVGd6WldFdE56a3hNelk1WWpZM1ptWXhJaXdpYm1KbUlqb2lNakF5TXkw'
    'eE1DMHdOVlF3TVRvd01qb3dPU3N3TWpvd01DSjlBaDBiVmJ4OVMxTFItcGY4aExXVlJRUFVmSz'
    'l6ckhadkE3QXBKNWFaWHdoQTdIMWota0hoY2NCak9BR1lYWlFULXRzN0pxM1NKbHpvNXZ0VWpH'
    'QnREZyJSC2FjY2Vzc1Rva2VuElEKF2FjY2Vzc190b2tlbl9leHBpcmVzX2F0GAMgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIUYWNjZXNzVG9rZW5FeHBpcmVzQXQS6wIKDXJlZnJl'
    'c2hfdG9rZW4YBCABKAlCxQKSQcECSr4CInY0LnB1YmxpYy5leUpsYldGcGJDSTZJbUV5UUdJdV'
    'pHVWlMQ0psZUhBaU9pSXlNREl6TFRFd0xUQTJWREF4T2pBeU9qQTVLekF5T2pBd0lpd2lhV0Yw'
    'SWpvaU1qQXlNeTB4TUMwd05WUXdNVG93TWpvd09Tc3dNam93TUNJc0ltbGtJam9pTldVeFpEWT'
    'NaR0V0TjJNNVlpMDBNelkxTFdFMFpEVXRNMk5qTUdFd05URXlOREZsSWl3aWJtSm1Jam9pTWpB'
    'eU15MHhNQzB3TlZRd01Ub3dNam93T1Nzd01qb3dNQ0o5Qm9YMzZ3MHBvMXZ2SFNqc0JQX0tXZU'
    'Z4VjF4UmJRYXlxYkp1SW9LMmpLcXkxQnQyUm9IeUpiTG9DRU8xNUNSVDVEblE2UDBBSGxCempz'
    'WHQ2MWFERHciUgxyZWZyZXNoVG9rZW4SUwoYcmVmcmVzaF90b2tlbl9leHBpcmVzX2F0GAUgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIVcmVmcmVzaFRva2VuRXhwaXJlc0F0EicK'
    'CmFjY291bnRfaWQYBiABKARCCJJBBUoDIjEiUglhY2NvdW50SWQ6FZJBEgoQKg5Mb2dpbiBSZX'
    'Nwb25zZQ==');

