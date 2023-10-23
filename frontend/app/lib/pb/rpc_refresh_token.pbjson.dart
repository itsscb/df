//
//  Generated code. Do not modify.
//  source: rpc_refresh_token.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refreshToken'},
  ],
  '7': {},
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EvoCCg1yZWZyZXNoX3Rva2VuGAEgASgJQtQCkkHQAioNUm'
    'VmcmVzaCBUb2tlbkq+AiJ2NC5wdWJsaWMuZXlKbGJXRnBiQ0k2SW1FeVFHSXVaR1VpTENKbGVI'
    'QWlPaUl5TURJekxURXdMVEEyVkRBeE9qQXlPakE1S3pBeU9qQXdJaXdpYVdGMElqb2lNakF5TX'
    'kweE1DMHdOVlF3TVRvd01qb3dPU3N3TWpvd01DSXNJbWxrSWpvaU5XVXhaRFkzWkdFdE4yTTVZ'
    'aTAwTXpZMUxXRTBaRFV0TTJOak1HRXdOVEV5TkRGbElpd2libUptSWpvaU1qQXlNeTB4TUMwd0'
    '5WUXdNVG93TWpvd09Tc3dNam93TUNKOUJvWDM2dzBwbzF2dkhTanNCUF9LV2VGeFYxeFJiUWF5'
    'cWJKdUlvSzJqS3F5MUJ0MlJvSHlKYkxvQ0VPMTVDUlQ1RG5RNlAwQUhsQnpqc1h0NjFhRER3Il'
    'IMcmVmcmVzaFRva2VuOrkDkkG1AwpfKhVSZWZyZXNoIFRva2VuIFJlcXVlc3QyNkdldCBhIG5l'
    'dyBBY2Nlc3MgVG9rZW4gYnkgc3VibWl0dGluZyB0aGUgUmVmcmVzaCBUb2tlbtIBDXJlZnJlc2'
    'hfdG9rZW4y0QJ7InJlZnJlc2hfdG9rZW4iOiAidjQucHVibGljLmV5SmxiV0ZwYkNJNkltRXlR'
    'R0l1WkdVaUxDSmxlSEFpT2lJeU1ESXpMVEV3TFRBMlZEQXhPakF5T2pBNUt6QXlPakF3SWl3aW'
    'FXRjBJam9pTWpBeU15MHhNQzB3TlZRd01Ub3dNam93T1Nzd01qb3dNQ0lzSW1sa0lqb2lOV1V4'
    'WkRZM1pHRXROMk01WWkwME16WTFMV0UwWkRVdE0yTmpNR0V3TlRFeU5ERmxJaXdpYm1KbUlqb2'
    'lNakF5TXkweE1DMHdOVlF3TVRvd01qb3dPU3N3TWpvd01DSjlCb1gzNncwcG8xdnZIU2pzQlBf'
    'S1dlRnhWMXhSYlFheXFiSnVJb0syaktxeTFCdDJSb0h5SmJMb0NFTzE1Q1JUNURuUTZQMEFIbE'
    'J6anNYdDYxYUREdyJ9');

@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = {
  '1': 'RefreshTokenResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'accessToken'},
    {'1': 'access_token_expires_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
  ],
  '7': {},
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoVG9rZW5SZXNwb25zZRL3AgoMYWNjZXNzX3Rva2VuGAEgASgJQtMCkkHPAioMQW'
    'NjZXNzIFRva2VuSr4CInY0LnB1YmxpYy5leUpsYldGcGJDSTZJbUV5UUdJdVpHVWlMQ0psZUhB'
    'aU9pSXlNREl6TFRFd0xUQTFWREF4T2pFM09qQTVLekF5T2pBd0lpd2lhV0YwSWpvaU1qQXlNeT'
    'B4TUMwd05WUXdNVG93TWpvd09Tc3dNam93TUNJc0ltbGtJam9pWmpsaE1qRTJPV1F0TVdZeFlT'
    'MDBZVGhpTFRnelpXRXROemt4TXpZNVlqWTNabVl4SWl3aWJtSm1Jam9pTWpBeU15MHhNQzB3Tl'
    'ZRd01Ub3dNam93T1Nzd01qb3dNQ0o5QWgwYlZieDlTMUxSLXBmOGhMV1ZSUVBVZks5enJIWnZB'
    'N0FwSjVhWlh3aEE3SDFqLWtIaGNjQmpPQUdZWFpRVC10czdKcTNTSmx6bzV2dFVqR0J0RGciUg'
    'thY2Nlc3NUb2tlbhJRChdhY2Nlc3NfdG9rZW5fZXhwaXJlc19hdBgCIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSFGFjY2Vzc1Rva2VuRXhwaXJlc0F0OvECkkHtAgoYKhZSZWZyZX'
    'NoIFRva2VuIFJlc3BvbnNlMtACeyJhY2Nlc3NfdG9rZW4iOiAidjQucHVibGljLmV5SmxiV0Zw'
    'YkNJNkltRXlRR0l1WkdVaUxDSmxlSEFpT2lJeU1ESXpMVEV3TFRBMVZEQXhPakUzT2pBNUt6QX'
    'lPakF3SWl3aWFXRjBJam9pTWpBeU15MHhNQzB3TlZRd01Ub3dNam93T1Nzd01qb3dNQ0lzSW1s'
    'a0lqb2laamxoTWpFMk9XUXRNV1l4WVMwMFlUaGlMVGd6WldFdE56a3hNelk1WWpZM1ptWXhJaX'
    'dpYm1KbUlqb2lNakF5TXkweE1DMHdOVlF3TVRvd01qb3dPU3N3TWpvd01DSjlBaDBiVmJ4OVMx'
    'TFItcGY4aExXVlJRUFVmSzl6ckhadkE3QXBKNWFaWHdoQTdIMWota0hoY2NCak9BR1lYWlFULX'
    'RzN0pxM1NKbHpvNXZ0VWpHQnREZyJ9');

