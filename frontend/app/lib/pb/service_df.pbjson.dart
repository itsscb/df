//
//  Generated code. Do not modify.
//  source: service_df.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'account.pbjson.dart' as $2;
import 'account_info.pbjson.dart' as $1;
import 'document.pbjson.dart' as $7;
import 'google/protobuf/timestamp.pbjson.dart' as $0;
import 'payment.pbjson.dart' as $3;
import 'person.pbjson.dart' as $4;
import 'returns_log.pbjson.dart' as $5;
import 'rpc_block_session.pbjson.dart' as $11;
import 'rpc_create_account.pbjson.dart' as $14;
import 'rpc_create_account_info.pbjson.dart' as $18;
import 'rpc_create_payment.pbjson.dart' as $26;
import 'rpc_create_person.pbjson.dart' as $21;
import 'rpc_delete_document.pbjson.dart' as $33;
import 'rpc_delete_payment.pbjson.dart' as $28;
import 'rpc_delete_person.pbjson.dart' as $24;
import 'rpc_get_account.pbjson.dart' as $12;
import 'rpc_get_account_info.pbjson.dart' as $16;
import 'rpc_get_payment.pbjson.dart' as $27;
import 'rpc_get_person.pbjson.dart' as $23;
import 'rpc_list_account_info.pbjson.dart' as $17;
import 'rpc_list_accounts.pbjson.dart' as $13;
import 'rpc_list_payments.pbjson.dart' as $29;
import 'rpc_list_persons.pbjson.dart' as $25;
import 'rpc_list_returns_log_by_person_id.pbjson.dart' as $31;
import 'rpc_list_sessions.pbjson.dart' as $10;
import 'rpc_login.pbjson.dart' as $8;
import 'rpc_refresh_token.pbjson.dart' as $9;
import 'rpc_update_account.pbjson.dart' as $15;
import 'rpc_update_account_info.pbjson.dart' as $19;
import 'rpc_update_account_privacy.pbjson.dart' as $20;
import 'rpc_update_payment.pbjson.dart' as $30;
import 'rpc_update_person.pbjson.dart' as $22;
import 'rpc_upload_document.pbjson.dart' as $32;
import 'rpc_verify_email.pbjson.dart' as $34;
import 'session.pbjson.dart' as $6;

const $core.Map<$core.String, $core.dynamic> dfServiceBase$json = {
  '1': 'df',
  '2': [
    {'1': 'Login', '2': '.pb.LoginRequest', '3': '.pb.LoginResponse', '4': {}},
    {'1': 'RefreshToken', '2': '.pb.RefreshTokenRequest', '3': '.pb.RefreshTokenResponse', '4': {}},
    {'1': 'ListSessions', '2': '.pb.ListSessionsRequest', '3': '.pb.ListSessionsResponse', '4': {}},
    {'1': 'BlockSession', '2': '.pb.BlockSessionRequest', '3': '.pb.BlockSessionResponse', '4': {}},
    {'1': 'GetAccount', '2': '.pb.GetAccountRequest', '3': '.pb.GetAccountResponse', '4': {}},
    {'1': 'ListAccounts', '2': '.pb.ListAccountsRequest', '3': '.pb.ListAccountsResponse', '4': {}},
    {'1': 'CreateAccount', '2': '.pb.CreateAccountRequest', '3': '.pb.CreateAccountResponse', '4': {}},
    {'1': 'UpdateAccount', '2': '.pb.UpdateAccountRequest', '3': '.pb.UpdateAccountResponse', '4': {}},
    {'1': 'GetAccountInfo', '2': '.pb.GetAccountInfoRequest', '3': '.pb.GetAccountInfoResponse', '4': {}},
    {'1': 'ListAccountInfo', '2': '.pb.ListAccountInfoRequest', '3': '.pb.ListAccountInfoResponse', '4': {}},
    {'1': 'CreateAccountInfo', '2': '.pb.CreateAccountInfoRequest', '3': '.pb.CreateAccountInfoResponse', '4': {}},
    {'1': 'UpdateAccountInfo', '2': '.pb.UpdateAccountInfoRequest', '3': '.pb.UpdateAccountInfoResponse', '4': {}},
    {'1': 'UpdateAccountPrivacy', '2': '.pb.UpdateAccountPrivacyRequest', '3': '.pb.UpdateAccountPrivacyResponse', '4': {}},
    {'1': 'CreatePerson', '2': '.pb.CreatePersonRequest', '3': '.pb.CreatePersonResponse', '4': {}},
    {'1': 'UpdatePerson', '2': '.pb.UpdatePersonRequest', '3': '.pb.UpdatePersonResponse', '4': {}},
    {'1': 'GetPerson', '2': '.pb.GetPersonRequest', '3': '.pb.GetPersonResponse', '4': {}},
    {'1': 'DeletePerson', '2': '.pb.DeletePersonRequest', '3': '.pb.DeletePersonResponse', '4': {}},
    {'1': 'ListPersons', '2': '.pb.ListPersonsRequest', '3': '.pb.ListPersonsResponse', '4': {}},
    {'1': 'CreatePayment', '2': '.pb.CreatePaymentRequest', '3': '.pb.CreatePaymentResponse', '4': {}},
    {'1': 'GetPayment', '2': '.pb.GetPaymentRequest', '3': '.pb.GetPaymentResponse', '4': {}},
    {'1': 'DeletePayment', '2': '.pb.DeletePaymentRequest', '3': '.pb.DeletePaymentResponse', '4': {}},
    {'1': 'ListPayments', '2': '.pb.ListPaymentsRequest', '3': '.pb.ListPaymentsResponse', '4': {}},
    {'1': 'UpdatePayment', '2': '.pb.UpdatePaymentRequest', '3': '.pb.UpdatePaymentResponse', '4': {}},
    {'1': 'ListReturnsLog', '2': '.pb.ListReturnsLogRequest', '3': '.pb.ListReturnsLogResponse', '4': {}},
    {'1': 'UploadDocument', '2': '.pb.UploadDocumentRequest', '3': '.pb.UploadDocumentResponse', '4': {}},
    {'1': 'DeleteDocument', '2': '.pb.DeleteDocumentRequest', '3': '.pb.DeleteDocumentResponse', '4': {}},
    {'1': 'VerifyEmail', '2': '.pb.VerifyEmailRequest', '3': '.pb.VerifyEmailResponse', '4': {}},
  ],
  '3': {},
};

@$core.Deprecated('Use dfServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> dfServiceBase$messageJson = {
  '.pb.LoginRequest': $8.LoginRequest$json,
  '.pb.LoginResponse': $8.LoginResponse$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.pb.RefreshTokenRequest': $9.RefreshTokenRequest$json,
  '.pb.RefreshTokenResponse': $9.RefreshTokenResponse$json,
  '.pb.ListSessionsRequest': $10.ListSessionsRequest$json,
  '.pb.ListSessionsResponse': $10.ListSessionsResponse$json,
  '.pb.Session': $6.Session$json,
  '.pb.BlockSessionRequest': $11.BlockSessionRequest$json,
  '.pb.BlockSessionResponse': $11.BlockSessionResponse$json,
  '.pb.GetAccountRequest': $12.GetAccountRequest$json,
  '.pb.GetAccountResponse': $12.GetAccountResponse$json,
  '.pb.Account': $2.Account$json,
  '.pb.ListAccountsRequest': $13.ListAccountsRequest$json,
  '.pb.ListAccountsResponse': $13.ListAccountsResponse$json,
  '.pb.CreateAccountRequest': $14.CreateAccountRequest$json,
  '.pb.CreateAccountResponse': $14.CreateAccountResponse$json,
  '.pb.UpdateAccountRequest': $15.UpdateAccountRequest$json,
  '.pb.UpdateAccountResponse': $15.UpdateAccountResponse$json,
  '.pb.GetAccountInfoRequest': $16.GetAccountInfoRequest$json,
  '.pb.GetAccountInfoResponse': $16.GetAccountInfoResponse$json,
  '.pb.AccountInfo': $1.AccountInfo$json,
  '.pb.ListAccountInfoRequest': $17.ListAccountInfoRequest$json,
  '.pb.ListAccountInfoResponse': $17.ListAccountInfoResponse$json,
  '.pb.CreateAccountInfoRequest': $18.CreateAccountInfoRequest$json,
  '.pb.CreateAccountInfoResponse': $18.CreateAccountInfoResponse$json,
  '.pb.UpdateAccountInfoRequest': $19.UpdateAccountInfoRequest$json,
  '.pb.UpdateAccountInfoResponse': $19.UpdateAccountInfoResponse$json,
  '.pb.UpdateAccountPrivacyRequest': $20.UpdateAccountPrivacyRequest$json,
  '.pb.UpdateAccountPrivacyResponse': $20.UpdateAccountPrivacyResponse$json,
  '.pb.CreatePersonRequest': $21.CreatePersonRequest$json,
  '.pb.CreatePersonResponse': $21.CreatePersonResponse$json,
  '.pb.Person': $4.Person$json,
  '.pb.UpdatePersonRequest': $22.UpdatePersonRequest$json,
  '.pb.UpdatePersonResponse': $22.UpdatePersonResponse$json,
  '.pb.GetPersonRequest': $23.GetPersonRequest$json,
  '.pb.GetPersonResponse': $23.GetPersonResponse$json,
  '.pb.DeletePersonRequest': $24.DeletePersonRequest$json,
  '.pb.DeletePersonResponse': $24.DeletePersonResponse$json,
  '.pb.ListPersonsRequest': $25.ListPersonsRequest$json,
  '.pb.ListPersonsResponse': $25.ListPersonsResponse$json,
  '.pb.CreatePaymentRequest': $26.CreatePaymentRequest$json,
  '.pb.CreatePaymentResponse': $26.CreatePaymentResponse$json,
  '.pb.Payment': $3.Payment$json,
  '.pb.GetPaymentRequest': $27.GetPaymentRequest$json,
  '.pb.GetPaymentResponse': $27.GetPaymentResponse$json,
  '.pb.DeletePaymentRequest': $28.DeletePaymentRequest$json,
  '.pb.DeletePaymentResponse': $28.DeletePaymentResponse$json,
  '.pb.ListPaymentsRequest': $29.ListPaymentsRequest$json,
  '.pb.ListPaymentsResponse': $29.ListPaymentsResponse$json,
  '.pb.UpdatePaymentRequest': $30.UpdatePaymentRequest$json,
  '.pb.UpdatePaymentResponse': $30.UpdatePaymentResponse$json,
  '.pb.ListReturnsLogRequest': $31.ListReturnsLogRequest$json,
  '.pb.ListReturnsLogResponse': $31.ListReturnsLogResponse$json,
  '.pb.ReturnsLog': $5.ReturnsLog$json,
  '.pb.UploadDocumentRequest': $32.UploadDocumentRequest$json,
  '.pb.UploadDocumentResponse': $32.UploadDocumentResponse$json,
  '.pb.Document': $7.Document$json,
  '.pb.DeleteDocumentRequest': $33.DeleteDocumentRequest$json,
  '.pb.DeleteDocumentResponse': $33.DeleteDocumentResponse$json,
  '.pb.VerifyEmailRequest': $34.VerifyEmailRequest$json,
  '.pb.VerifyEmailResponse': $34.VerifyEmailResponse$json,
};

/// Descriptor for `df`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List dfServiceDescriptor = $convert.base64Decode(
    'CgJkZhJCCgVMb2dpbhIQLnBiLkxvZ2luUmVxdWVzdBoRLnBiLkxvZ2luUmVzcG9uc2UiFILT5J'
    'MCDiIJL3YxL2xvZ2luOgEqEmgKDFJlZnJlc2hUb2tlbhIXLnBiLlJlZnJlc2hUb2tlblJlcXVl'
    'c3QaGC5wYi5SZWZyZXNoVG9rZW5SZXNwb25zZSIlgtPkkwIfIhovdjEvc2Vzc2lvbnMvcmVmcm'
    'VzaF90b2tlbjoBKhKkAQoMTGlzdFNlc3Npb25zEhcucGIuTGlzdFNlc3Npb25zUmVxdWVzdBoY'
    'LnBiLkxpc3RTZXNzaW9uc1Jlc3BvbnNlImGSQS8SG0xpc3QgU2Vzc2lvbnMgYnkgYWNjb3VudF'
    '9pZGIQCg4KCkJlYXJlckF1dGgSAILT5JMCKRInL3YxL3Nlc3Npb25zL2xpc3Rfc2Vzc2lvbnMv'
    'e2FjY291bnRfaWR9EpIBCgxCbG9ja1Nlc3Npb24SFy5wYi5CbG9ja1Nlc3Npb25SZXF1ZXN0Gh'
    'gucGIuQmxvY2tTZXNzaW9uUmVzcG9uc2UiT5JBJxITQmxvY2sgU2Vzc2lvbiBieSBJRGIQCg4K'
    'CkJlYXJlckF1dGgSAILT5JMCHzIaL3YxL3Nlc3Npb25zL2Jsb2NrX3Nlc3Npb246ASoSkgEKCk'
    'dldEFjY291bnQSFS5wYi5HZXRBY2NvdW50UmVxdWVzdBoWLnBiLkdldEFjY291bnRSZXNwb25z'
    'ZSJVkkEtEhlHZXQgQWNjb3VudCBieSBhY2NvdW50X2lkYhAKDgoKQmVhcmVyQXV0aBIAgtPkkw'
    'IfEh0vdjEvYWNjb3VudHMvZ2V0X2FjY291bnQve2lkfRKWAQoMTGlzdEFjY291bnRzEhcucGIu'
    'TGlzdEFjY291bnRzUmVxdWVzdBoYLnBiLkxpc3RBY2NvdW50c1Jlc3BvbnNlIlOSQS4SGkxpc3'
    'QgQWNjb3VudHMgW2FkbWluIG9ubHldYhAKDgoKQmVhcmVyQXV0aBIAgtPkkwIcEhovdjEvYWNj'
    'b3VudHMvbGlzdF9hY2NvdW50cxKDAQoNQ3JlYXRlQWNjb3VudBIYLnBiLkNyZWF0ZUFjY291bn'
    'RSZXF1ZXN0GhkucGIuQ3JlYXRlQWNjb3VudFJlc3BvbnNlIj2SQRQSEkNyZWF0ZSBBY2NvdW50'
    'SW5mb4LT5JMCICIbL3YxL2FjY291bnRzL2NyZWF0ZV9hY2NvdW50OgEqEpEBCg1VcGRhdGVBY2'
    'NvdW50EhgucGIuVXBkYXRlQWNjb3VudFJlcXVlc3QaGS5wYi5VcGRhdGVBY2NvdW50UmVzcG9u'
    'c2UiS5JBIhIOVXBkYXRlIEFjY291bnRiEAoOCgpCZWFyZXJBdXRoEgCC0+STAiAyGy92MS9hY2'
    'NvdW50cy91cGRhdGVfYWNjb3VudDoBKhKvAQoOR2V0QWNjb3VudEluZm8SGS5wYi5HZXRBY2Nv'
    'dW50SW5mb1JlcXVlc3QaGi5wYi5HZXRBY2NvdW50SW5mb1Jlc3BvbnNlImaSQTESHUdldCBBY2'
    'NvdW50SW5mbyBieSBhY2NvdW50X2lkYhAKDgoKQmVhcmVyQXV0aBIAgtPkkwIsEiovdjEvYWNj'
    'b3VudHMvZ2V0X2FjY291bnRfaW5mby97YWNjb3VudF9pZH0SpwEKD0xpc3RBY2NvdW50SW5mbx'
    'IaLnBiLkxpc3RBY2NvdW50SW5mb1JlcXVlc3QaGy5wYi5MaXN0QWNjb3VudEluZm9SZXNwb25z'
    'ZSJbkkEyEh5MaXN0IEFjY291bnRJbmZvcyBbYWRtaW4gb25seV1iEAoOCgpCZWFyZXJBdXRoEg'
    'CC0+STAiASHi92MS9hY2NvdW50cy9saXN0X2FjY291bnRfaW5mbxKmAQoRQ3JlYXRlQWNjb3Vu'
    'dEluZm8SHC5wYi5DcmVhdGVBY2NvdW50SW5mb1JlcXVlc3QaHS5wYi5DcmVhdGVBY2NvdW50SW'
    '5mb1Jlc3BvbnNlIlSSQSYSEkNyZWF0ZSBBY2NvdW50SW5mb2IQCg4KCkJlYXJlckF1dGgSAILT'
    '5JMCJSIgL3YxL2FjY291bnRzL2NyZWF0ZV9hY2NvdW50X2luZm86ASoSpgEKEVVwZGF0ZUFjY2'
    '91bnRJbmZvEhwucGIuVXBkYXRlQWNjb3VudEluZm9SZXF1ZXN0Gh0ucGIuVXBkYXRlQWNjb3Vu'
    'dEluZm9SZXNwb25zZSJUkkEmEhJVcGRhdGUgQWNjb3VudEluZm9iEAoOCgpCZWFyZXJBdXRoEg'
    'CC0+STAiUyIC92MS9hY2NvdW50cy91cGRhdGVfYWNjb3VudF9pbmZvOgEqEr8BChRVcGRhdGVB'
    'Y2NvdW50UHJpdmFjeRIfLnBiLlVwZGF0ZUFjY291bnRQcml2YWN5UmVxdWVzdBogLnBiLlVwZG'
    'F0ZUFjY291bnRQcml2YWN5UmVzcG9uc2UiZJJBMxIfVXBkYXRlIEFjY291bnQgUHJpdmFjeSBT'
    'ZXR0aW5nc2IQCg4KCkJlYXJlckF1dGgSAILT5JMCKDIjL3YxL2FjY291bnRzL3VwZGF0ZV9hY2'
    'NvdW50X3ByaXZhY3k6ASoSiwEKDENyZWF0ZVBlcnNvbhIXLnBiLkNyZWF0ZVBlcnNvblJlcXVl'
    'c3QaGC5wYi5DcmVhdGVQZXJzb25SZXNwb25zZSJIkkEhEg1DcmVhdGUgUGVyc29uYhAKDgoKQm'
    'VhcmVyQXV0aBIAgtPkkwIeIhkvdjEvcGVyc29ucy9jcmVhdGVfcGVyc29uOgEqEosBCgxVcGRh'
    'dGVQZXJzb24SFy5wYi5VcGRhdGVQZXJzb25SZXF1ZXN0GhgucGIuVXBkYXRlUGVyc29uUmVzcG'
    '9uc2UiSJJBIRINVXBkYXRlIFBlcnNvbmIQCg4KCkJlYXJlckF1dGgSAILT5JMCHjIZL3YxL3Bl'
    'cnNvbnMvdXBkYXRlX3BlcnNvbjoBKhKEAQoJR2V0UGVyc29uEhQucGIuR2V0UGVyc29uUmVxdW'
    'VzdBoVLnBiLkdldFBlcnNvblJlc3BvbnNlIkqSQSQSEEdldCBQZXJzb24gYnkgSURiEAoOCgpC'
    'ZWFyZXJBdXRoEgCC0+STAh0SGy92MS9wZXJzb25zL2dldF9wZXJzb24ve2lkfRKTAQoMRGVsZX'
    'RlUGVyc29uEhcucGIuRGVsZXRlUGVyc29uUmVxdWVzdBoYLnBiLkRlbGV0ZVBlcnNvblJlc3Bv'
    'bnNlIlCSQScSE0RlbGV0ZSBQZXJzb24gYnkgSURiEAoOCgpCZWFyZXJBdXRoEgCC0+STAiAqHi'
    '92MS9wZXJzb25zL2RlbGV0ZV9wZXJzb24ve2lkfRKeAQoLTGlzdFBlcnNvbnMSFi5wYi5MaXN0'
    'UGVyc29uc1JlcXVlc3QaFy5wYi5MaXN0UGVyc29uc1Jlc3BvbnNlIl6SQS4SGkxpc3QgUGVyc2'
    '9ucyBieSBhY2NvdW50X2lkYhAKDgoKQmVhcmVyQXV0aBIAgtPkkwInEiUvdjEvcGVyc29ucy9s'
    'aXN0X3BlcnNvbnMve2FjY291bnRfaWR9EpEBCg1DcmVhdGVQYXltZW50EhgucGIuQ3JlYXRlUG'
    'F5bWVudFJlcXVlc3QaGS5wYi5DcmVhdGVQYXltZW50UmVzcG9uc2UiS5JBIhIOQ3JlYXRlIFBh'
    'eW1lbnRiEAoOCgpCZWFyZXJBdXRoEgCC0+STAiAiGy92MS9wYXltZW50cy9jcmVhdGVfcGF5bW'
    'VudDoBKhKKAQoKR2V0UGF5bWVudBIVLnBiLkdldFBheW1lbnRSZXF1ZXN0GhYucGIuR2V0UGF5'
    'bWVudFJlc3BvbnNlIk2SQSUSEUdldCBQYXltZW50IGJ5IElEYhAKDgoKQmVhcmVyQXV0aBIAgt'
    'PkkwIfEh0vdjEvcGF5bWVudHMvZ2V0X3BheW1lbnQve2lkfRKZAQoNRGVsZXRlUGF5bWVudBIY'
    'LnBiLkRlbGV0ZVBheW1lbnRSZXF1ZXN0GhkucGIuRGVsZXRlUGF5bWVudFJlc3BvbnNlIlOSQS'
    'gSFERlbGV0ZSBQYXltZW50IGJ5IElEYhAKDgoKQmVhcmVyQXV0aBIAgtPkkwIiKiAvdjEvcGF5'
    'bWVudHMvZGVsZXRlX3BheW1lbnQve2lkfRKkAQoMTGlzdFBheW1lbnRzEhcucGIuTGlzdFBheW'
    '1lbnRzUmVxdWVzdBoYLnBiLkxpc3RQYXltZW50c1Jlc3BvbnNlImGSQS8SG0xpc3QgUGF5bWVu'
    'dHMgYnkgYWNjb3VudF9pZGIQCg4KCkJlYXJlckF1dGgSAILT5JMCKRInL3YxL3BheW1lbnRzL2'
    'xpc3RfcGF5bWVudHMve2FjY291bnRfaWR9EpEBCg1VcGRhdGVQYXltZW50EhgucGIuVXBkYXRl'
    'UGF5bWVudFJlcXVlc3QaGS5wYi5VcGRhdGVQYXltZW50UmVzcG9uc2UiS5JBIhIOVXBkYXRlIF'
    'BheW1lbnRiEAoOCgpCZWFyZXJBdXRoEgCC0+STAiAyGy92MS9wYXltZW50cy91cGRhdGVfcGF5'
    'bWVudDoBKhKwAQoOTGlzdFJldHVybnNMb2cSGS5wYi5MaXN0UmV0dXJuc0xvZ1JlcXVlc3QaGi'
    '5wYi5MaXN0UmV0dXJuc0xvZ1Jlc3BvbnNlImeSQTASHExpc3QgUmV0dXJuc0xvZyBieSBwZXJz'
    'b25faWRiEAoOCgpCZWFyZXJBdXRoEgCC0+STAi4SLC92MS9yZXR1cm5zX2xvZy9saXN0X3JldH'
    'VybnNfbG9nL3twZXJzb25faWR9EsoCCg5VcGxvYWREb2N1bWVudBIZLnBiLlVwbG9hZERvY3Vt'
    'ZW50UmVxdWVzdBoaLnBiLlVwbG9hZERvY3VtZW50UmVzcG9uc2UigAKSQeABEhtVcGxvYWQgRG'
    '9jdW1lbnQgW29ubHkgSFRUUF0argFUZXN0aW5nIHZpYSBzd2FnZ2VyIGlzIG5vdCBwb3NzaWJs'
    'ZS4gVHJ5IGBgYGN1cmwgLVggUE9TVCAtSCAiQXV0aG9yaXphdGlvbjogQmVhcmVyIHt0b2tlbn'
    '0iIC1GICJmaWxlPUAvcGF0aC90by9maWxlIiAtRiAicGVyc29uX2lkPTEiICJodHRwOi8ve3Nl'
    'cnZlclVSSX0vZG9jdW1lbnRzL3VwbG9hZCJgYGBiEAoOCgpCZWFyZXJBdXRoEgCC0+STAhYiES'
    '9kb2N1bWVudHMvdXBsb2FkOgEqEp8BCg5EZWxldGVEb2N1bWVudBIZLnBiLkRlbGV0ZURvY3Vt'
    'ZW50UmVxdWVzdBoaLnBiLkRlbGV0ZURvY3VtZW50UmVzcG9uc2UiVpJBKRIVRGVsZXRlIERvY3'
    'VtZW50IGJ5IElEYhAKDgoKQmVhcmVyQXV0aBIAgtPkkwIkKiIvdjEvZG9jdW1lbnRzL2RlbGV0'
    'ZV9kb2N1bWVudC97aWR9EqIBCgtWZXJpZnlFbWFpbBIWLnBiLlZlcmlmeUVtYWlsUmVxdWVzdB'
    'oXLnBiLlZlcmlmeUVtYWlsUmVzcG9uc2UiYpJBLRIrVmVyaWZ5IEVtYWlsIHdpdGggYWNjb3Vu'
    'dF9pZCBhbmQgc2VjcmV0X2tleYLT5JMCLBIqL3YxL3ZlcmlmeV9lbWFpbC97YWNjb3VudF9pZH'
    '0ve3NlY3JldF9rZXl9GgeSQQQSAmRm');

