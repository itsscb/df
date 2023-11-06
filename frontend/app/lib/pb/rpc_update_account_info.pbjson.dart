//
//  Generated code. Do not modify.
//  source: rpc_update_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateAccountInfoRequestDescriptor instead')
const UpdateAccountInfoRequest$json = {
  '1': 'UpdateAccountInfoRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
    {'1': 'firstname', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'firstname', '17': true},
    {'1': 'lastname', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'lastname', '17': true},
    {'1': 'street', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'street', '17': true},
    {'1': 'city', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'city', '17': true},
    {'1': 'zip', '3': 8, '4': 1, '5': 9, '9': 4, '10': 'zip', '17': true},
    {'1': 'country', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'country', '17': true},
    {'1': 'phone', '3': 10, '4': 1, '5': 9, '9': 6, '10': 'phone', '17': true},
    {'1': 'birthday', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '9': 7, '10': 'birthday', '17': true},
  ],
  '7': {},
  '8': [
    {'1': '_firstname'},
    {'1': '_lastname'},
    {'1': '_street'},
    {'1': '_city'},
    {'1': '_zip'},
    {'1': '_country'},
    {'1': '_phone'},
    {'1': '_birthday'},
  ],
};

/// Descriptor for `UpdateAccountInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountInfoRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVBY2NvdW50SW5mb1JlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoBFIJYWNjb3VudE'
    'lkEiEKCWZpcnN0bmFtZRgEIAEoCUgAUglmaXJzdG5hbWWIAQESHwoIbGFzdG5hbWUYBSABKAlI'
    'AVIIbGFzdG5hbWWIAQESGwoGc3RyZWV0GAYgASgJSAJSBnN0cmVldIgBARIXCgRjaXR5GAcgAS'
    'gJSANSBGNpdHmIAQESFQoDemlwGAggASgJSARSA3ppcIgBARIdCgdjb3VudHJ5GAkgASgJSAVS'
    'B2NvdW50cnmIAQESGQoFcGhvbmUYCiABKAlIBlIFcGhvbmWIAQESWAoIYmlydGhkYXkYCyABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQhuSQRhKFiIxOTkwLTEwLTA1VDAwOjAwOjAw'
    'WiJIB1IIYmlydGhkYXmIAQE6ZJJBYQowKhJVcGRhdGUgQWNjb3VudEluZm8yFVVwZGF0ZSBhbi'
    'BBY2NvdW50SW5mb9IBAmlkMi17ImFjY291bnRfaWQiOiAiMSIsICJzdHJlZXQiOiAiRGVhdGgg'
    'U3RhciAyIn1CDAoKX2ZpcnN0bmFtZUILCglfbGFzdG5hbWVCCQoHX3N0cmVldEIHCgVfY2l0eU'
    'IGCgRfemlwQgoKCF9jb3VudHJ5QggKBl9waG9uZUILCglfYmlydGhkYXk=');

@$core.Deprecated('Use updateAccountInfoResponseDescriptor instead')
const UpdateAccountInfoResponse$json = {
  '1': 'UpdateAccountInfoResponse',
  '2': [
    {'1': 'account_info', '3': 1, '4': 1, '5': 11, '6': '.pb.AccountInfo', '8': {}, '10': 'accountInfo'},
  ],
  '7': {},
};

/// Descriptor for `UpdateAccountInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccountInfoResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVBY2NvdW50SW5mb1Jlc3BvbnNlEjcKDGFjY291bnRfaW5mbxgBIAEoCzIPLnBiLk'
    'FjY291bnRJbmZvQgOSQQBSC2FjY291bnRJbmZvOjOSQTAKLioPVXBkYXRlZCBBY2NvdW50MhtS'
    'ZXR1cm5zIHRoZSB1cGRhdGVkIEFjY291bnQ=');

