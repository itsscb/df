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

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_block_session.pb.dart' as $3;
import 'rpc_create_account.pb.dart' as $6;
import 'rpc_create_account_info.pb.dart' as $10;
import 'rpc_create_payment.pb.dart' as $18;
import 'rpc_create_person.pb.dart' as $13;
import 'rpc_delete_document.pb.dart' as $25;
import 'rpc_delete_payment.pb.dart' as $20;
import 'rpc_delete_person.pb.dart' as $16;
import 'rpc_get_account.pb.dart' as $4;
import 'rpc_get_account_info.pb.dart' as $8;
import 'rpc_get_payment.pb.dart' as $19;
import 'rpc_get_person.pb.dart' as $15;
import 'rpc_list_account_info.pb.dart' as $9;
import 'rpc_list_accounts.pb.dart' as $5;
import 'rpc_list_payments.pb.dart' as $21;
import 'rpc_list_persons.pb.dart' as $17;
import 'rpc_list_returns_log_by_person_id.pb.dart' as $23;
import 'rpc_list_sessions.pb.dart' as $2;
import 'rpc_login.pb.dart' as $0;
import 'rpc_refresh_token.pb.dart' as $1;
import 'rpc_update_account.pb.dart' as $7;
import 'rpc_update_account_info.pb.dart' as $11;
import 'rpc_update_account_privacy.pb.dart' as $12;
import 'rpc_update_payment.pb.dart' as $22;
import 'rpc_update_person.pb.dart' as $14;
import 'rpc_upload_document.pb.dart' as $24;
import 'rpc_verify_email.pb.dart' as $26;

export 'service_df.pb.dart';

@$pb.GrpcServiceName('pb.df')
class dfClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/pb.df/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$refreshToken = $grpc.ClientMethod<$1.RefreshTokenRequest, $1.RefreshTokenResponse>(
      '/pb.df/RefreshToken',
      ($1.RefreshTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RefreshTokenResponse.fromBuffer(value));
  static final _$listSessions = $grpc.ClientMethod<$2.ListSessionsRequest, $2.ListSessionsResponse>(
      '/pb.df/ListSessions',
      ($2.ListSessionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListSessionsResponse.fromBuffer(value));
  static final _$blockSession = $grpc.ClientMethod<$3.BlockSessionRequest, $3.BlockSessionResponse>(
      '/pb.df/BlockSession',
      ($3.BlockSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.BlockSessionResponse.fromBuffer(value));
  static final _$getAccount = $grpc.ClientMethod<$4.GetAccountRequest, $4.GetAccountResponse>(
      '/pb.df/GetAccount',
      ($4.GetAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetAccountResponse.fromBuffer(value));
  static final _$listAccounts = $grpc.ClientMethod<$5.ListAccountsRequest, $5.ListAccountsResponse>(
      '/pb.df/ListAccounts',
      ($5.ListAccountsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ListAccountsResponse.fromBuffer(value));
  static final _$createAccount = $grpc.ClientMethod<$6.CreateAccountRequest, $6.CreateAccountResponse>(
      '/pb.df/CreateAccount',
      ($6.CreateAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.CreateAccountResponse.fromBuffer(value));
  static final _$updateAccount = $grpc.ClientMethod<$7.UpdateAccountRequest, $7.UpdateAccountResponse>(
      '/pb.df/UpdateAccount',
      ($7.UpdateAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.UpdateAccountResponse.fromBuffer(value));
  static final _$getAccountInfo = $grpc.ClientMethod<$8.GetAccountInfoRequest, $8.GetAccountInfoResponse>(
      '/pb.df/GetAccountInfo',
      ($8.GetAccountInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.GetAccountInfoResponse.fromBuffer(value));
  static final _$listAccountInfo = $grpc.ClientMethod<$9.ListAccountInfoRequest, $9.ListAccountInfoResponse>(
      '/pb.df/ListAccountInfo',
      ($9.ListAccountInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.ListAccountInfoResponse.fromBuffer(value));
  static final _$createAccountInfo = $grpc.ClientMethod<$10.CreateAccountInfoRequest, $10.CreateAccountInfoResponse>(
      '/pb.df/CreateAccountInfo',
      ($10.CreateAccountInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CreateAccountInfoResponse.fromBuffer(value));
  static final _$updateAccountInfo = $grpc.ClientMethod<$11.UpdateAccountInfoRequest, $11.UpdateAccountInfoResponse>(
      '/pb.df/UpdateAccountInfo',
      ($11.UpdateAccountInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.UpdateAccountInfoResponse.fromBuffer(value));
  static final _$updateAccountPrivacy = $grpc.ClientMethod<$12.UpdateAccountPrivacyRequest, $12.UpdateAccountPrivacyResponse>(
      '/pb.df/UpdateAccountPrivacy',
      ($12.UpdateAccountPrivacyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.UpdateAccountPrivacyResponse.fromBuffer(value));
  static final _$createPerson = $grpc.ClientMethod<$13.CreatePersonRequest, $13.CreatePersonResponse>(
      '/pb.df/CreatePerson',
      ($13.CreatePersonRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.CreatePersonResponse.fromBuffer(value));
  static final _$updatePerson = $grpc.ClientMethod<$14.UpdatePersonRequest, $14.UpdatePersonResponse>(
      '/pb.df/UpdatePerson',
      ($14.UpdatePersonRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.UpdatePersonResponse.fromBuffer(value));
  static final _$getPerson = $grpc.ClientMethod<$15.GetPersonRequest, $15.GetPersonResponse>(
      '/pb.df/GetPerson',
      ($15.GetPersonRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.GetPersonResponse.fromBuffer(value));
  static final _$deletePerson = $grpc.ClientMethod<$16.DeletePersonRequest, $16.DeletePersonResponse>(
      '/pb.df/DeletePerson',
      ($16.DeletePersonRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $16.DeletePersonResponse.fromBuffer(value));
  static final _$listPersons = $grpc.ClientMethod<$17.ListPersonsRequest, $17.ListPersonsResponse>(
      '/pb.df/ListPersons',
      ($17.ListPersonsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.ListPersonsResponse.fromBuffer(value));
  static final _$createPayment = $grpc.ClientMethod<$18.CreatePaymentRequest, $18.CreatePaymentResponse>(
      '/pb.df/CreatePayment',
      ($18.CreatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $18.CreatePaymentResponse.fromBuffer(value));
  static final _$getPayment = $grpc.ClientMethod<$19.GetPaymentRequest, $19.GetPaymentResponse>(
      '/pb.df/GetPayment',
      ($19.GetPaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $19.GetPaymentResponse.fromBuffer(value));
  static final _$deletePayment = $grpc.ClientMethod<$20.DeletePaymentRequest, $20.DeletePaymentResponse>(
      '/pb.df/DeletePayment',
      ($20.DeletePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $20.DeletePaymentResponse.fromBuffer(value));
  static final _$listPayments = $grpc.ClientMethod<$21.ListPaymentsRequest, $21.ListPaymentsResponse>(
      '/pb.df/ListPayments',
      ($21.ListPaymentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $21.ListPaymentsResponse.fromBuffer(value));
  static final _$updatePayment = $grpc.ClientMethod<$22.UpdatePaymentRequest, $22.UpdatePaymentResponse>(
      '/pb.df/UpdatePayment',
      ($22.UpdatePaymentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $22.UpdatePaymentResponse.fromBuffer(value));
  static final _$listReturnsLog = $grpc.ClientMethod<$23.ListReturnsLogRequest, $23.ListReturnsLogResponse>(
      '/pb.df/ListReturnsLog',
      ($23.ListReturnsLogRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $23.ListReturnsLogResponse.fromBuffer(value));
  static final _$uploadDocument = $grpc.ClientMethod<$24.UploadDocumentRequest, $24.UploadDocumentResponse>(
      '/pb.df/UploadDocument',
      ($24.UploadDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $24.UploadDocumentResponse.fromBuffer(value));
  static final _$deleteDocument = $grpc.ClientMethod<$25.DeleteDocumentRequest, $25.DeleteDocumentResponse>(
      '/pb.df/DeleteDocument',
      ($25.DeleteDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $25.DeleteDocumentResponse.fromBuffer(value));
  static final _$verifyEmail = $grpc.ClientMethod<$26.VerifyEmailRequest, $26.VerifyEmailResponse>(
      '/pb.df/VerifyEmail',
      ($26.VerifyEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $26.VerifyEmailResponse.fromBuffer(value));

  dfClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.RefreshTokenResponse> refreshToken($1.RefreshTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListSessionsResponse> listSessions($2.ListSessionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listSessions, request, options: options);
  }

  $grpc.ResponseFuture<$3.BlockSessionResponse> blockSession($3.BlockSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$blockSession, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetAccountResponse> getAccount($4.GetAccountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccount, request, options: options);
  }

  $grpc.ResponseFuture<$5.ListAccountsResponse> listAccounts($5.ListAccountsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAccounts, request, options: options);
  }

  $grpc.ResponseFuture<$6.CreateAccountResponse> createAccount($6.CreateAccountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$7.UpdateAccountResponse> updateAccount($7.UpdateAccountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccount, request, options: options);
  }

  $grpc.ResponseFuture<$8.GetAccountInfoResponse> getAccountInfo($8.GetAccountInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountInfo, request, options: options);
  }

  $grpc.ResponseFuture<$9.ListAccountInfoResponse> listAccountInfo($9.ListAccountInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAccountInfo, request, options: options);
  }

  $grpc.ResponseFuture<$10.CreateAccountInfoResponse> createAccountInfo($10.CreateAccountInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccountInfo, request, options: options);
  }

  $grpc.ResponseFuture<$11.UpdateAccountInfoResponse> updateAccountInfo($11.UpdateAccountInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccountInfo, request, options: options);
  }

  $grpc.ResponseFuture<$12.UpdateAccountPrivacyResponse> updateAccountPrivacy($12.UpdateAccountPrivacyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccountPrivacy, request, options: options);
  }

  $grpc.ResponseFuture<$13.CreatePersonResponse> createPerson($13.CreatePersonRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPerson, request, options: options);
  }

  $grpc.ResponseFuture<$14.UpdatePersonResponse> updatePerson($14.UpdatePersonRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePerson, request, options: options);
  }

  $grpc.ResponseFuture<$15.GetPersonResponse> getPerson($15.GetPersonRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPerson, request, options: options);
  }

  $grpc.ResponseFuture<$16.DeletePersonResponse> deletePerson($16.DeletePersonRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePerson, request, options: options);
  }

  $grpc.ResponseFuture<$17.ListPersonsResponse> listPersons($17.ListPersonsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPersons, request, options: options);
  }

  $grpc.ResponseFuture<$18.CreatePaymentResponse> createPayment($18.CreatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPayment, request, options: options);
  }

  $grpc.ResponseFuture<$19.GetPaymentResponse> getPayment($19.GetPaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPayment, request, options: options);
  }

  $grpc.ResponseFuture<$20.DeletePaymentResponse> deletePayment($20.DeletePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePayment, request, options: options);
  }

  $grpc.ResponseFuture<$21.ListPaymentsResponse> listPayments($21.ListPaymentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPayments, request, options: options);
  }

  $grpc.ResponseFuture<$22.UpdatePaymentResponse> updatePayment($22.UpdatePaymentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePayment, request, options: options);
  }

  $grpc.ResponseFuture<$23.ListReturnsLogResponse> listReturnsLog($23.ListReturnsLogRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listReturnsLog, request, options: options);
  }

  $grpc.ResponseFuture<$24.UploadDocumentResponse> uploadDocument($24.UploadDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadDocument, request, options: options);
  }

  $grpc.ResponseFuture<$25.DeleteDocumentResponse> deleteDocument($25.DeleteDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDocument, request, options: options);
  }

  $grpc.ResponseFuture<$26.VerifyEmailResponse> verifyEmail($26.VerifyEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmail, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.df')
abstract class dfServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.df';

  dfServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RefreshTokenRequest, $1.RefreshTokenResponse>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshTokenRequest.fromBuffer(value),
        ($1.RefreshTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListSessionsRequest, $2.ListSessionsResponse>(
        'ListSessions',
        listSessions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListSessionsRequest.fromBuffer(value),
        ($2.ListSessionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.BlockSessionRequest, $3.BlockSessionResponse>(
        'BlockSession',
        blockSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.BlockSessionRequest.fromBuffer(value),
        ($3.BlockSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetAccountRequest, $4.GetAccountResponse>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetAccountRequest.fromBuffer(value),
        ($4.GetAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ListAccountsRequest, $5.ListAccountsResponse>(
        'ListAccounts',
        listAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ListAccountsRequest.fromBuffer(value),
        ($5.ListAccountsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateAccountRequest, $6.CreateAccountResponse>(
        'CreateAccount',
        createAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateAccountRequest.fromBuffer(value),
        ($6.CreateAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateAccountRequest, $7.UpdateAccountResponse>(
        'UpdateAccount',
        updateAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateAccountRequest.fromBuffer(value),
        ($7.UpdateAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetAccountInfoRequest, $8.GetAccountInfoResponse>(
        'GetAccountInfo',
        getAccountInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetAccountInfoRequest.fromBuffer(value),
        ($8.GetAccountInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ListAccountInfoRequest, $9.ListAccountInfoResponse>(
        'ListAccountInfo',
        listAccountInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.ListAccountInfoRequest.fromBuffer(value),
        ($9.ListAccountInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.CreateAccountInfoRequest, $10.CreateAccountInfoResponse>(
        'CreateAccountInfo',
        createAccountInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CreateAccountInfoRequest.fromBuffer(value),
        ($10.CreateAccountInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.UpdateAccountInfoRequest, $11.UpdateAccountInfoResponse>(
        'UpdateAccountInfo',
        updateAccountInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.UpdateAccountInfoRequest.fromBuffer(value),
        ($11.UpdateAccountInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.UpdateAccountPrivacyRequest, $12.UpdateAccountPrivacyResponse>(
        'UpdateAccountPrivacy',
        updateAccountPrivacy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.UpdateAccountPrivacyRequest.fromBuffer(value),
        ($12.UpdateAccountPrivacyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$13.CreatePersonRequest, $13.CreatePersonResponse>(
        'CreatePerson',
        createPerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $13.CreatePersonRequest.fromBuffer(value),
        ($13.CreatePersonResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.UpdatePersonRequest, $14.UpdatePersonResponse>(
        'UpdatePerson',
        updatePerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.UpdatePersonRequest.fromBuffer(value),
        ($14.UpdatePersonResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.GetPersonRequest, $15.GetPersonResponse>(
        'GetPerson',
        getPerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.GetPersonRequest.fromBuffer(value),
        ($15.GetPersonResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.DeletePersonRequest, $16.DeletePersonResponse>(
        'DeletePerson',
        deletePerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.DeletePersonRequest.fromBuffer(value),
        ($16.DeletePersonResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ListPersonsRequest, $17.ListPersonsResponse>(
        'ListPersons',
        listPersons_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ListPersonsRequest.fromBuffer(value),
        ($17.ListPersonsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$18.CreatePaymentRequest, $18.CreatePaymentResponse>(
        'CreatePayment',
        createPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $18.CreatePaymentRequest.fromBuffer(value),
        ($18.CreatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$19.GetPaymentRequest, $19.GetPaymentResponse>(
        'GetPayment',
        getPayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $19.GetPaymentRequest.fromBuffer(value),
        ($19.GetPaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$20.DeletePaymentRequest, $20.DeletePaymentResponse>(
        'DeletePayment',
        deletePayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $20.DeletePaymentRequest.fromBuffer(value),
        ($20.DeletePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$21.ListPaymentsRequest, $21.ListPaymentsResponse>(
        'ListPayments',
        listPayments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $21.ListPaymentsRequest.fromBuffer(value),
        ($21.ListPaymentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$22.UpdatePaymentRequest, $22.UpdatePaymentResponse>(
        'UpdatePayment',
        updatePayment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $22.UpdatePaymentRequest.fromBuffer(value),
        ($22.UpdatePaymentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$23.ListReturnsLogRequest, $23.ListReturnsLogResponse>(
        'ListReturnsLog',
        listReturnsLog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $23.ListReturnsLogRequest.fromBuffer(value),
        ($23.ListReturnsLogResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$24.UploadDocumentRequest, $24.UploadDocumentResponse>(
        'UploadDocument',
        uploadDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $24.UploadDocumentRequest.fromBuffer(value),
        ($24.UploadDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$25.DeleteDocumentRequest, $25.DeleteDocumentResponse>(
        'DeleteDocument',
        deleteDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $25.DeleteDocumentRequest.fromBuffer(value),
        ($25.DeleteDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$26.VerifyEmailRequest, $26.VerifyEmailResponse>(
        'VerifyEmail',
        verifyEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $26.VerifyEmailRequest.fromBuffer(value),
        ($26.VerifyEmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.RefreshTokenResponse> refreshToken_Pre($grpc.ServiceCall call, $async.Future<$1.RefreshTokenRequest> request) async {
    return refreshToken(call, await request);
  }

  $async.Future<$2.ListSessionsResponse> listSessions_Pre($grpc.ServiceCall call, $async.Future<$2.ListSessionsRequest> request) async {
    return listSessions(call, await request);
  }

  $async.Future<$3.BlockSessionResponse> blockSession_Pre($grpc.ServiceCall call, $async.Future<$3.BlockSessionRequest> request) async {
    return blockSession(call, await request);
  }

  $async.Future<$4.GetAccountResponse> getAccount_Pre($grpc.ServiceCall call, $async.Future<$4.GetAccountRequest> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$5.ListAccountsResponse> listAccounts_Pre($grpc.ServiceCall call, $async.Future<$5.ListAccountsRequest> request) async {
    return listAccounts(call, await request);
  }

  $async.Future<$6.CreateAccountResponse> createAccount_Pre($grpc.ServiceCall call, $async.Future<$6.CreateAccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$7.UpdateAccountResponse> updateAccount_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateAccountRequest> request) async {
    return updateAccount(call, await request);
  }

  $async.Future<$8.GetAccountInfoResponse> getAccountInfo_Pre($grpc.ServiceCall call, $async.Future<$8.GetAccountInfoRequest> request) async {
    return getAccountInfo(call, await request);
  }

  $async.Future<$9.ListAccountInfoResponse> listAccountInfo_Pre($grpc.ServiceCall call, $async.Future<$9.ListAccountInfoRequest> request) async {
    return listAccountInfo(call, await request);
  }

  $async.Future<$10.CreateAccountInfoResponse> createAccountInfo_Pre($grpc.ServiceCall call, $async.Future<$10.CreateAccountInfoRequest> request) async {
    return createAccountInfo(call, await request);
  }

  $async.Future<$11.UpdateAccountInfoResponse> updateAccountInfo_Pre($grpc.ServiceCall call, $async.Future<$11.UpdateAccountInfoRequest> request) async {
    return updateAccountInfo(call, await request);
  }

  $async.Future<$12.UpdateAccountPrivacyResponse> updateAccountPrivacy_Pre($grpc.ServiceCall call, $async.Future<$12.UpdateAccountPrivacyRequest> request) async {
    return updateAccountPrivacy(call, await request);
  }

  $async.Future<$13.CreatePersonResponse> createPerson_Pre($grpc.ServiceCall call, $async.Future<$13.CreatePersonRequest> request) async {
    return createPerson(call, await request);
  }

  $async.Future<$14.UpdatePersonResponse> updatePerson_Pre($grpc.ServiceCall call, $async.Future<$14.UpdatePersonRequest> request) async {
    return updatePerson(call, await request);
  }

  $async.Future<$15.GetPersonResponse> getPerson_Pre($grpc.ServiceCall call, $async.Future<$15.GetPersonRequest> request) async {
    return getPerson(call, await request);
  }

  $async.Future<$16.DeletePersonResponse> deletePerson_Pre($grpc.ServiceCall call, $async.Future<$16.DeletePersonRequest> request) async {
    return deletePerson(call, await request);
  }

  $async.Future<$17.ListPersonsResponse> listPersons_Pre($grpc.ServiceCall call, $async.Future<$17.ListPersonsRequest> request) async {
    return listPersons(call, await request);
  }

  $async.Future<$18.CreatePaymentResponse> createPayment_Pre($grpc.ServiceCall call, $async.Future<$18.CreatePaymentRequest> request) async {
    return createPayment(call, await request);
  }

  $async.Future<$19.GetPaymentResponse> getPayment_Pre($grpc.ServiceCall call, $async.Future<$19.GetPaymentRequest> request) async {
    return getPayment(call, await request);
  }

  $async.Future<$20.DeletePaymentResponse> deletePayment_Pre($grpc.ServiceCall call, $async.Future<$20.DeletePaymentRequest> request) async {
    return deletePayment(call, await request);
  }

  $async.Future<$21.ListPaymentsResponse> listPayments_Pre($grpc.ServiceCall call, $async.Future<$21.ListPaymentsRequest> request) async {
    return listPayments(call, await request);
  }

  $async.Future<$22.UpdatePaymentResponse> updatePayment_Pre($grpc.ServiceCall call, $async.Future<$22.UpdatePaymentRequest> request) async {
    return updatePayment(call, await request);
  }

  $async.Future<$23.ListReturnsLogResponse> listReturnsLog_Pre($grpc.ServiceCall call, $async.Future<$23.ListReturnsLogRequest> request) async {
    return listReturnsLog(call, await request);
  }

  $async.Future<$24.UploadDocumentResponse> uploadDocument_Pre($grpc.ServiceCall call, $async.Future<$24.UploadDocumentRequest> request) async {
    return uploadDocument(call, await request);
  }

  $async.Future<$25.DeleteDocumentResponse> deleteDocument_Pre($grpc.ServiceCall call, $async.Future<$25.DeleteDocumentRequest> request) async {
    return deleteDocument(call, await request);
  }

  $async.Future<$26.VerifyEmailResponse> verifyEmail_Pre($grpc.ServiceCall call, $async.Future<$26.VerifyEmailRequest> request) async {
    return verifyEmail(call, await request);
  }

  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$1.RefreshTokenResponse> refreshToken($grpc.ServiceCall call, $1.RefreshTokenRequest request);
  $async.Future<$2.ListSessionsResponse> listSessions($grpc.ServiceCall call, $2.ListSessionsRequest request);
  $async.Future<$3.BlockSessionResponse> blockSession($grpc.ServiceCall call, $3.BlockSessionRequest request);
  $async.Future<$4.GetAccountResponse> getAccount($grpc.ServiceCall call, $4.GetAccountRequest request);
  $async.Future<$5.ListAccountsResponse> listAccounts($grpc.ServiceCall call, $5.ListAccountsRequest request);
  $async.Future<$6.CreateAccountResponse> createAccount($grpc.ServiceCall call, $6.CreateAccountRequest request);
  $async.Future<$7.UpdateAccountResponse> updateAccount($grpc.ServiceCall call, $7.UpdateAccountRequest request);
  $async.Future<$8.GetAccountInfoResponse> getAccountInfo($grpc.ServiceCall call, $8.GetAccountInfoRequest request);
  $async.Future<$9.ListAccountInfoResponse> listAccountInfo($grpc.ServiceCall call, $9.ListAccountInfoRequest request);
  $async.Future<$10.CreateAccountInfoResponse> createAccountInfo($grpc.ServiceCall call, $10.CreateAccountInfoRequest request);
  $async.Future<$11.UpdateAccountInfoResponse> updateAccountInfo($grpc.ServiceCall call, $11.UpdateAccountInfoRequest request);
  $async.Future<$12.UpdateAccountPrivacyResponse> updateAccountPrivacy($grpc.ServiceCall call, $12.UpdateAccountPrivacyRequest request);
  $async.Future<$13.CreatePersonResponse> createPerson($grpc.ServiceCall call, $13.CreatePersonRequest request);
  $async.Future<$14.UpdatePersonResponse> updatePerson($grpc.ServiceCall call, $14.UpdatePersonRequest request);
  $async.Future<$15.GetPersonResponse> getPerson($grpc.ServiceCall call, $15.GetPersonRequest request);
  $async.Future<$16.DeletePersonResponse> deletePerson($grpc.ServiceCall call, $16.DeletePersonRequest request);
  $async.Future<$17.ListPersonsResponse> listPersons($grpc.ServiceCall call, $17.ListPersonsRequest request);
  $async.Future<$18.CreatePaymentResponse> createPayment($grpc.ServiceCall call, $18.CreatePaymentRequest request);
  $async.Future<$19.GetPaymentResponse> getPayment($grpc.ServiceCall call, $19.GetPaymentRequest request);
  $async.Future<$20.DeletePaymentResponse> deletePayment($grpc.ServiceCall call, $20.DeletePaymentRequest request);
  $async.Future<$21.ListPaymentsResponse> listPayments($grpc.ServiceCall call, $21.ListPaymentsRequest request);
  $async.Future<$22.UpdatePaymentResponse> updatePayment($grpc.ServiceCall call, $22.UpdatePaymentRequest request);
  $async.Future<$23.ListReturnsLogResponse> listReturnsLog($grpc.ServiceCall call, $23.ListReturnsLogRequest request);
  $async.Future<$24.UploadDocumentResponse> uploadDocument($grpc.ServiceCall call, $24.UploadDocumentRequest request);
  $async.Future<$25.DeleteDocumentResponse> deleteDocument($grpc.ServiceCall call, $25.DeleteDocumentRequest request);
  $async.Future<$26.VerifyEmailResponse> verifyEmail($grpc.ServiceCall call, $26.VerifyEmailRequest request);
}
