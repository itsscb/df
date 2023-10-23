//
//  Generated code. Do not modify.
//  source: rpc_update_account_privacy.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateAccountPrivacyRequestDescriptor instead')
const UpdateAccountPrivacyRequest$json = {
  '1': 'UpdateAccountPrivacyRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '8': {}, '10': 'accountId'},
    {'1': 'privacy_accepted', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'privacyAccepted'},
  ],
  '7': {},
};

/// Descriptor for `UpdateAccountPrivacyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountPrivacyRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVBY2NvdW50UHJpdmFjeVJlcXVlc3QSLQoKYWNjb3VudF9pZBgBIAEoBEIOkkELSg'
    'ExogIFaW50NjRSCWFjY291bnRJZBI1ChBwcml2YWN5X2FjY2VwdGVkGAIgASgIQgqSQQdKBWZh'
    'bHNlUg9wcml2YWN5QWNjZXB0ZWQ6oQGSQZ0BCmsqI1VwZGF0ZSBBY2NvdW50IEluZm8gUHJpdm'
    'FjeSBDb25zZW50MixVcGRhdGUgdGhlIFByaXZhY3kgQ29uc2VudCBvZiBhbiBBY2NvdW50SW5m'
    'b9IBAmlk0gEQcHJpdmFjeV9hY2NlcHRlZDIueyJhY2NvdW50X2lkIjogIjEiLCAicHJpdmFjeV'
    '9hY2NlcHRlZCI6IHRydWUgfQ==');

@$core.Deprecated('Use updateAccountPrivacyResponseDescriptor instead')
const UpdateAccountPrivacyResponse$json = {
  '1': 'UpdateAccountPrivacyResponse',
  '2': [
    {'1': 'account_info', '3': 1, '4': 1, '5': 11, '6': '.pb.AccountInfo', '8': {}, '10': 'accountInfo'},
  ],
  '7': {},
};

/// Descriptor for `UpdateAccountPrivacyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountPrivacyResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVBY2NvdW50UHJpdmFjeVJlc3BvbnNlEkwKDGFjY291bnRfaW5mbxgBIAEoCzIPLn'
    'BiLkFjY291bnRJbmZvQhiSQRUqE1VwZGF0ZWQgQWNjb3VudEluZm9SC2FjY291bnRJbmZvOiuS'
    'QSgKJiokVXBkYXRlIEFjY291bnQgSW5mbyBQcml2YWN5IFJlc3BvbnNl');

