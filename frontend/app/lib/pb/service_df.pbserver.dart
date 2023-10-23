//
//  Generated code. Do not modify.
//  source: service_df.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
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
import 'service_df.pbjson.dart';

export 'service_df.pb.dart';

abstract class dfServiceBase extends $pb.GeneratedService {
  $async.Future<$8.LoginResponse> login($pb.ServerContext ctx, $8.LoginRequest request);
  $async.Future<$9.RefreshTokenResponse> refreshToken($pb.ServerContext ctx, $9.RefreshTokenRequest request);
  $async.Future<$10.ListSessionsResponse> listSessions($pb.ServerContext ctx, $10.ListSessionsRequest request);
  $async.Future<$11.BlockSessionResponse> blockSession($pb.ServerContext ctx, $11.BlockSessionRequest request);
  $async.Future<$12.GetAccountResponse> getAccount($pb.ServerContext ctx, $12.GetAccountRequest request);
  $async.Future<$13.ListAccountsResponse> listAccounts($pb.ServerContext ctx, $13.ListAccountsRequest request);
  $async.Future<$14.CreateAccountResponse> createAccount($pb.ServerContext ctx, $14.CreateAccountRequest request);
  $async.Future<$15.UpdateAccountResponse> updateAccount($pb.ServerContext ctx, $15.UpdateAccountRequest request);
  $async.Future<$16.GetAccountInfoResponse> getAccountInfo($pb.ServerContext ctx, $16.GetAccountInfoRequest request);
  $async.Future<$17.ListAccountInfoResponse> listAccountInfo($pb.ServerContext ctx, $17.ListAccountInfoRequest request);
  $async.Future<$18.CreateAccountInfoResponse> createAccountInfo($pb.ServerContext ctx, $18.CreateAccountInfoRequest request);
  $async.Future<$19.UpdateAccountInfoResponse> updateAccountInfo($pb.ServerContext ctx, $19.UpdateAccountInfoRequest request);
  $async.Future<$20.UpdateAccountPrivacyResponse> updateAccountPrivacy($pb.ServerContext ctx, $20.UpdateAccountPrivacyRequest request);
  $async.Future<$21.CreatePersonResponse> createPerson($pb.ServerContext ctx, $21.CreatePersonRequest request);
  $async.Future<$22.UpdatePersonResponse> updatePerson($pb.ServerContext ctx, $22.UpdatePersonRequest request);
  $async.Future<$23.GetPersonResponse> getPerson($pb.ServerContext ctx, $23.GetPersonRequest request);
  $async.Future<$24.DeletePersonResponse> deletePerson($pb.ServerContext ctx, $24.DeletePersonRequest request);
  $async.Future<$25.ListPersonsResponse> listPersons($pb.ServerContext ctx, $25.ListPersonsRequest request);
  $async.Future<$26.CreatePaymentResponse> createPayment($pb.ServerContext ctx, $26.CreatePaymentRequest request);
  $async.Future<$27.GetPaymentResponse> getPayment($pb.ServerContext ctx, $27.GetPaymentRequest request);
  $async.Future<$28.DeletePaymentResponse> deletePayment($pb.ServerContext ctx, $28.DeletePaymentRequest request);
  $async.Future<$29.ListPaymentsResponse> listPayments($pb.ServerContext ctx, $29.ListPaymentsRequest request);
  $async.Future<$30.UpdatePaymentResponse> updatePayment($pb.ServerContext ctx, $30.UpdatePaymentRequest request);
  $async.Future<$31.ListReturnsLogResponse> listReturnsLog($pb.ServerContext ctx, $31.ListReturnsLogRequest request);
  $async.Future<$32.UploadDocumentResponse> uploadDocument($pb.ServerContext ctx, $32.UploadDocumentRequest request);
  $async.Future<$33.DeleteDocumentResponse> deleteDocument($pb.ServerContext ctx, $33.DeleteDocumentRequest request);
  $async.Future<$34.VerifyEmailResponse> verifyEmail($pb.ServerContext ctx, $34.VerifyEmailRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Login': return $8.LoginRequest();
      case 'RefreshToken': return $9.RefreshTokenRequest();
      case 'ListSessions': return $10.ListSessionsRequest();
      case 'BlockSession': return $11.BlockSessionRequest();
      case 'GetAccount': return $12.GetAccountRequest();
      case 'ListAccounts': return $13.ListAccountsRequest();
      case 'CreateAccount': return $14.CreateAccountRequest();
      case 'UpdateAccount': return $15.UpdateAccountRequest();
      case 'GetAccountInfo': return $16.GetAccountInfoRequest();
      case 'ListAccountInfo': return $17.ListAccountInfoRequest();
      case 'CreateAccountInfo': return $18.CreateAccountInfoRequest();
      case 'UpdateAccountInfo': return $19.UpdateAccountInfoRequest();
      case 'UpdateAccountPrivacy': return $20.UpdateAccountPrivacyRequest();
      case 'CreatePerson': return $21.CreatePersonRequest();
      case 'UpdatePerson': return $22.UpdatePersonRequest();
      case 'GetPerson': return $23.GetPersonRequest();
      case 'DeletePerson': return $24.DeletePersonRequest();
      case 'ListPersons': return $25.ListPersonsRequest();
      case 'CreatePayment': return $26.CreatePaymentRequest();
      case 'GetPayment': return $27.GetPaymentRequest();
      case 'DeletePayment': return $28.DeletePaymentRequest();
      case 'ListPayments': return $29.ListPaymentsRequest();
      case 'UpdatePayment': return $30.UpdatePaymentRequest();
      case 'ListReturnsLog': return $31.ListReturnsLogRequest();
      case 'UploadDocument': return $32.UploadDocumentRequest();
      case 'DeleteDocument': return $33.DeleteDocumentRequest();
      case 'VerifyEmail': return $34.VerifyEmailRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Login': return this.login(ctx, request as $8.LoginRequest);
      case 'RefreshToken': return this.refreshToken(ctx, request as $9.RefreshTokenRequest);
      case 'ListSessions': return this.listSessions(ctx, request as $10.ListSessionsRequest);
      case 'BlockSession': return this.blockSession(ctx, request as $11.BlockSessionRequest);
      case 'GetAccount': return this.getAccount(ctx, request as $12.GetAccountRequest);
      case 'ListAccounts': return this.listAccounts(ctx, request as $13.ListAccountsRequest);
      case 'CreateAccount': return this.createAccount(ctx, request as $14.CreateAccountRequest);
      case 'UpdateAccount': return this.updateAccount(ctx, request as $15.UpdateAccountRequest);
      case 'GetAccountInfo': return this.getAccountInfo(ctx, request as $16.GetAccountInfoRequest);
      case 'ListAccountInfo': return this.listAccountInfo(ctx, request as $17.ListAccountInfoRequest);
      case 'CreateAccountInfo': return this.createAccountInfo(ctx, request as $18.CreateAccountInfoRequest);
      case 'UpdateAccountInfo': return this.updateAccountInfo(ctx, request as $19.UpdateAccountInfoRequest);
      case 'UpdateAccountPrivacy': return this.updateAccountPrivacy(ctx, request as $20.UpdateAccountPrivacyRequest);
      case 'CreatePerson': return this.createPerson(ctx, request as $21.CreatePersonRequest);
      case 'UpdatePerson': return this.updatePerson(ctx, request as $22.UpdatePersonRequest);
      case 'GetPerson': return this.getPerson(ctx, request as $23.GetPersonRequest);
      case 'DeletePerson': return this.deletePerson(ctx, request as $24.DeletePersonRequest);
      case 'ListPersons': return this.listPersons(ctx, request as $25.ListPersonsRequest);
      case 'CreatePayment': return this.createPayment(ctx, request as $26.CreatePaymentRequest);
      case 'GetPayment': return this.getPayment(ctx, request as $27.GetPaymentRequest);
      case 'DeletePayment': return this.deletePayment(ctx, request as $28.DeletePaymentRequest);
      case 'ListPayments': return this.listPayments(ctx, request as $29.ListPaymentsRequest);
      case 'UpdatePayment': return this.updatePayment(ctx, request as $30.UpdatePaymentRequest);
      case 'ListReturnsLog': return this.listReturnsLog(ctx, request as $31.ListReturnsLogRequest);
      case 'UploadDocument': return this.uploadDocument(ctx, request as $32.UploadDocumentRequest);
      case 'DeleteDocument': return this.deleteDocument(ctx, request as $33.DeleteDocumentRequest);
      case 'VerifyEmail': return this.verifyEmail(ctx, request as $34.VerifyEmailRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => dfServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => dfServiceBase$messageJson;
}

