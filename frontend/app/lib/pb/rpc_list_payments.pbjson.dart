//
//  Generated code. Do not modify.
//  source: rpc_list_payments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listPaymentsRequestDescriptor instead')
const ListPaymentsRequest$json = {
  '1': 'ListPaymentsRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 4, '10': 'accountId'},
  ],
  '7': {},
};

/// Descriptor for `ListPaymentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UGF5bWVudHNSZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKARSCWFjY291bnRJZDpQkk'
    'FNCjcqDExpc3RQYXltZW50czIaUmV0dXJucyBhIExpc3Qgb2YgUGF5bWVudHPSAQphY2NvdW50'
    'X2lkMhJ7ImFjY291bnRfaWQiOiAxIH0=');

@$core.Deprecated('Use listPaymentsResponseDescriptor instead')
const ListPaymentsResponse$json = {
  '1': 'ListPaymentsResponse',
  '2': [
    {'1': 'payments', '3': 1, '4': 3, '5': 11, '6': '.pb.Payment', '8': {}, '10': 'payments'},
  ],
  '7': {},
};

/// Descriptor for `ListPaymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UGF5bWVudHNSZXNwb25zZRIsCghwYXltZW50cxgBIAMoCzILLnBiLlBheW1lbnRCA5'
    'JBAFIIcGF5bWVudHM6MZJBLgosKhVMaXN0UGF5bWVudHMgUmVzcG9uc2UyE1JldHVybnMgdGhl'
    'IFBheW1lbnQ=');

