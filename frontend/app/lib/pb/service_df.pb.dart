//
//  Generated code. Do not modify.
//  source: service_df.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_block_session.pb.dart' as $11;
import 'rpc_create_account.pb.dart' as $14;
import 'rpc_create_account_info.pb.dart' as $18;
import 'rpc_create_payment.pb.dart' as $26;
import 'rpc_create_person.pb.dart' as $21;
import 'rpc_delete_document.pb.dart' as $33;
import 'rpc_delete_payment.pb.dart' as $28;
import 'rpc_delete_person.pb.dart' as $24;
import 'rpc_get_account.pb.dart' as $12;
import 'rpc_get_account_info.pb.dart' as $16;
import 'rpc_get_payment.pb.dart' as $27;
import 'rpc_get_person.pb.dart' as $23;
import 'rpc_list_account_info.pb.dart' as $17;
import 'rpc_list_accounts.pb.dart' as $13;
import 'rpc_list_payments.pb.dart' as $29;
import 'rpc_list_persons.pb.dart' as $25;
import 'rpc_list_returns_log_by_person_id.pb.dart' as $31;
import 'rpc_list_sessions.pb.dart' as $10;
import 'rpc_login.pb.dart' as $8;
import 'rpc_refresh_token.pb.dart' as $9;
import 'rpc_update_account.pb.dart' as $15;
import 'rpc_update_account_info.pb.dart' as $19;
import 'rpc_update_account_privacy.pb.dart' as $20;
import 'rpc_update_payment.pb.dart' as $30;
import 'rpc_update_person.pb.dart' as $22;
import 'rpc_upload_document.pb.dart' as $32;
import 'rpc_verify_email.pb.dart' as $34;

class dfApi {
  $pb.RpcClient _client;
  dfApi(this._client);

  $async.Future<$8.LoginResponse> login($pb.ClientContext? ctx, $8.LoginRequest request) =>
    _client.invoke<$8.LoginResponse>(ctx, 'df', 'Login', request, $8.LoginResponse())
  ;
  $async.Future<$9.RefreshTokenResponse> refreshToken($pb.ClientContext? ctx, $9.RefreshTokenRequest request) =>
    _client.invoke<$9.RefreshTokenResponse>(ctx, 'df', 'RefreshToken', request, $9.RefreshTokenResponse())
  ;
  $async.Future<$10.ListSessionsResponse> listSessions($pb.ClientContext? ctx, $10.ListSessionsRequest request) =>
    _client.invoke<$10.ListSessionsResponse>(ctx, 'df', 'ListSessions', request, $10.ListSessionsResponse())
  ;
  $async.Future<$11.BlockSessionResponse> blockSession($pb.ClientContext? ctx, $11.BlockSessionRequest request) =>
    _client.invoke<$11.BlockSessionResponse>(ctx, 'df', 'BlockSession', request, $11.BlockSessionResponse())
  ;
  $async.Future<$12.GetAccountResponse> getAccount($pb.ClientContext? ctx, $12.GetAccountRequest request) =>
    _client.invoke<$12.GetAccountResponse>(ctx, 'df', 'GetAccount', request, $12.GetAccountResponse())
  ;
  $async.Future<$13.ListAccountsResponse> listAccounts($pb.ClientContext? ctx, $13.ListAccountsRequest request) =>
    _client.invoke<$13.ListAccountsResponse>(ctx, 'df', 'ListAccounts', request, $13.ListAccountsResponse())
  ;
  $async.Future<$14.CreateAccountResponse> createAccount($pb.ClientContext? ctx, $14.CreateAccountRequest request) =>
    _client.invoke<$14.CreateAccountResponse>(ctx, 'df', 'CreateAccount', request, $14.CreateAccountResponse())
  ;
  $async.Future<$15.UpdateAccountResponse> updateAccount($pb.ClientContext? ctx, $15.UpdateAccountRequest request) =>
    _client.invoke<$15.UpdateAccountResponse>(ctx, 'df', 'UpdateAccount', request, $15.UpdateAccountResponse())
  ;
  $async.Future<$16.GetAccountInfoResponse> getAccountInfo($pb.ClientContext? ctx, $16.GetAccountInfoRequest request) =>
    _client.invoke<$16.GetAccountInfoResponse>(ctx, 'df', 'GetAccountInfo', request, $16.GetAccountInfoResponse())
  ;
  $async.Future<$17.ListAccountInfoResponse> listAccountInfo($pb.ClientContext? ctx, $17.ListAccountInfoRequest request) =>
    _client.invoke<$17.ListAccountInfoResponse>(ctx, 'df', 'ListAccountInfo', request, $17.ListAccountInfoResponse())
  ;
  $async.Future<$18.CreateAccountInfoResponse> createAccountInfo($pb.ClientContext? ctx, $18.CreateAccountInfoRequest request) =>
    _client.invoke<$18.CreateAccountInfoResponse>(ctx, 'df', 'CreateAccountInfo', request, $18.CreateAccountInfoResponse())
  ;
  $async.Future<$19.UpdateAccountInfoResponse> updateAccountInfo($pb.ClientContext? ctx, $19.UpdateAccountInfoRequest request) =>
    _client.invoke<$19.UpdateAccountInfoResponse>(ctx, 'df', 'UpdateAccountInfo', request, $19.UpdateAccountInfoResponse())
  ;
  $async.Future<$20.UpdateAccountPrivacyResponse> updateAccountPrivacy($pb.ClientContext? ctx, $20.UpdateAccountPrivacyRequest request) =>
    _client.invoke<$20.UpdateAccountPrivacyResponse>(ctx, 'df', 'UpdateAccountPrivacy', request, $20.UpdateAccountPrivacyResponse())
  ;
  $async.Future<$21.CreatePersonResponse> createPerson($pb.ClientContext? ctx, $21.CreatePersonRequest request) =>
    _client.invoke<$21.CreatePersonResponse>(ctx, 'df', 'CreatePerson', request, $21.CreatePersonResponse())
  ;
  $async.Future<$22.UpdatePersonResponse> updatePerson($pb.ClientContext? ctx, $22.UpdatePersonRequest request) =>
    _client.invoke<$22.UpdatePersonResponse>(ctx, 'df', 'UpdatePerson', request, $22.UpdatePersonResponse())
  ;
  $async.Future<$23.GetPersonResponse> getPerson($pb.ClientContext? ctx, $23.GetPersonRequest request) =>
    _client.invoke<$23.GetPersonResponse>(ctx, 'df', 'GetPerson', request, $23.GetPersonResponse())
  ;
  $async.Future<$24.DeletePersonResponse> deletePerson($pb.ClientContext? ctx, $24.DeletePersonRequest request) =>
    _client.invoke<$24.DeletePersonResponse>(ctx, 'df', 'DeletePerson', request, $24.DeletePersonResponse())
  ;
  $async.Future<$25.ListPersonsResponse> listPersons($pb.ClientContext? ctx, $25.ListPersonsRequest request) =>
    _client.invoke<$25.ListPersonsResponse>(ctx, 'df', 'ListPersons', request, $25.ListPersonsResponse())
  ;
  $async.Future<$26.CreatePaymentResponse> createPayment($pb.ClientContext? ctx, $26.CreatePaymentRequest request) =>
    _client.invoke<$26.CreatePaymentResponse>(ctx, 'df', 'CreatePayment', request, $26.CreatePaymentResponse())
  ;
  $async.Future<$27.GetPaymentResponse> getPayment($pb.ClientContext? ctx, $27.GetPaymentRequest request) =>
    _client.invoke<$27.GetPaymentResponse>(ctx, 'df', 'GetPayment', request, $27.GetPaymentResponse())
  ;
  $async.Future<$28.DeletePaymentResponse> deletePayment($pb.ClientContext? ctx, $28.DeletePaymentRequest request) =>
    _client.invoke<$28.DeletePaymentResponse>(ctx, 'df', 'DeletePayment', request, $28.DeletePaymentResponse())
  ;
  $async.Future<$29.ListPaymentsResponse> listPayments($pb.ClientContext? ctx, $29.ListPaymentsRequest request) =>
    _client.invoke<$29.ListPaymentsResponse>(ctx, 'df', 'ListPayments', request, $29.ListPaymentsResponse())
  ;
  $async.Future<$30.UpdatePaymentResponse> updatePayment($pb.ClientContext? ctx, $30.UpdatePaymentRequest request) =>
    _client.invoke<$30.UpdatePaymentResponse>(ctx, 'df', 'UpdatePayment', request, $30.UpdatePaymentResponse())
  ;
  $async.Future<$31.ListReturnsLogResponse> listReturnsLog($pb.ClientContext? ctx, $31.ListReturnsLogRequest request) =>
    _client.invoke<$31.ListReturnsLogResponse>(ctx, 'df', 'ListReturnsLog', request, $31.ListReturnsLogResponse())
  ;
  $async.Future<$32.UploadDocumentResponse> uploadDocument($pb.ClientContext? ctx, $32.UploadDocumentRequest request) =>
    _client.invoke<$32.UploadDocumentResponse>(ctx, 'df', 'UploadDocument', request, $32.UploadDocumentResponse())
  ;
  $async.Future<$33.DeleteDocumentResponse> deleteDocument($pb.ClientContext? ctx, $33.DeleteDocumentRequest request) =>
    _client.invoke<$33.DeleteDocumentResponse>(ctx, 'df', 'DeleteDocument', request, $33.DeleteDocumentResponse())
  ;
  $async.Future<$34.VerifyEmailResponse> verifyEmail($pb.ClientContext? ctx, $34.VerifyEmailRequest request) =>
    _client.invoke<$34.VerifyEmailResponse>(ctx, 'df', 'VerifyEmail', request, $34.VerifyEmailResponse())
  ;
}

