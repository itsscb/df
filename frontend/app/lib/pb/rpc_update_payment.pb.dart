//
//  Generated code. Do not modify.
//  source: rpc_update_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'payment.pb.dart' as $30;

class UpdatePaymentRequest extends $pb.GeneratedMessage {
  factory UpdatePaymentRequest({
    $fixnum.Int64? id,
    $core.String? paymentCategory,
    $core.String? bankname,
    $core.String? iBAN,
    $core.String? bIC,
    $core.String? paypalAccount,
    $core.String? paypalId,
    $core.String? paymentSystem,
    $core.String? type,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (paymentCategory != null) {
      $result.paymentCategory = paymentCategory;
    }
    if (bankname != null) {
      $result.bankname = bankname;
    }
    if (iBAN != null) {
      $result.iBAN = iBAN;
    }
    if (bIC != null) {
      $result.bIC = bIC;
    }
    if (paypalAccount != null) {
      $result.paypalAccount = paypalAccount;
    }
    if (paypalId != null) {
      $result.paypalId = paypalId;
    }
    if (paymentSystem != null) {
      $result.paymentSystem = paymentSystem;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  UpdatePaymentRequest._() : super();
  factory UpdatePaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'paymentCategory')
    ..aOS(3, _omitFieldNames ? '' : 'bankname')
    ..aOS(4, _omitFieldNames ? '' : 'IBAN', protoName: 'IBAN')
    ..aOS(5, _omitFieldNames ? '' : 'BIC', protoName: 'BIC')
    ..aOS(6, _omitFieldNames ? '' : 'paypalAccount')
    ..aOS(7, _omitFieldNames ? '' : 'paypalId')
    ..aOS(8, _omitFieldNames ? '' : 'paymentSystem')
    ..aOS(9, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePaymentRequest clone() => UpdatePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePaymentRequest copyWith(void Function(UpdatePaymentRequest) updates) => super.copyWith((message) => updates(message as UpdatePaymentRequest)) as UpdatePaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentRequest create() => UpdatePaymentRequest._();
  UpdatePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePaymentRequest> createRepeated() => $pb.PbList<UpdatePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePaymentRequest>(create);
  static UpdatePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentCategory => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentCategory($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaymentCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bankname => $_getSZ(2);
  @$pb.TagNumber(3)
  set bankname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBankname() => $_has(2);
  @$pb.TagNumber(3)
  void clearBankname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get iBAN => $_getSZ(3);
  @$pb.TagNumber(4)
  set iBAN($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIBAN() => $_has(3);
  @$pb.TagNumber(4)
  void clearIBAN() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get bIC => $_getSZ(4);
  @$pb.TagNumber(5)
  set bIC($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBIC() => $_has(4);
  @$pb.TagNumber(5)
  void clearBIC() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get paypalAccount => $_getSZ(5);
  @$pb.TagNumber(6)
  set paypalAccount($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPaypalAccount() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaypalAccount() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get paypalId => $_getSZ(6);
  @$pb.TagNumber(7)
  set paypalId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPaypalId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaypalId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get paymentSystem => $_getSZ(7);
  @$pb.TagNumber(8)
  set paymentSystem($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPaymentSystem() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymentSystem() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get type => $_getSZ(8);
  @$pb.TagNumber(9)
  set type($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);
}

class UpdatePaymentResponse extends $pb.GeneratedMessage {
  factory UpdatePaymentResponse({
    $30.Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  UpdatePaymentResponse._() : super();
  factory UpdatePaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$30.Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: $30.Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePaymentResponse clone() => UpdatePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePaymentResponse copyWith(void Function(UpdatePaymentResponse) updates) => super.copyWith((message) => updates(message as UpdatePaymentResponse)) as UpdatePaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePaymentResponse create() => UpdatePaymentResponse._();
  UpdatePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePaymentResponse> createRepeated() => $pb.PbList<UpdatePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePaymentResponse>(create);
  static UpdatePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $30.Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment($30.Payment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => clearField(1);
  @$pb.TagNumber(1)
  $30.Payment ensurePayment() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
