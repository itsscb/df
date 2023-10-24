//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $27;

class Payment extends $pb.GeneratedMessage {
  factory Payment({
    $fixnum.Int64? id,
    $fixnum.Int64? accountId,
    $core.String? paymentCategory,
    $core.String? bankname,
    $core.String? iBAN,
    $core.String? bIC,
    $core.String? paypalAccount,
    $core.String? paypalId,
    $core.String? paymentSystem,
    $core.String? type,
    $core.String? creator,
    $27.Timestamp? created,
    $core.String? changer,
    $27.Timestamp? changed,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (accountId != null) {
      $result.accountId = accountId;
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
    if (creator != null) {
      $result.creator = creator;
    }
    if (created != null) {
      $result.created = created;
    }
    if (changer != null) {
      $result.changer = changer;
    }
    if (changed != null) {
      $result.changed = changed;
    }
    return $result;
  }
  Payment._() : super();
  factory Payment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Payment', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'paymentCategory')
    ..aOS(4, _omitFieldNames ? '' : 'bankname')
    ..aOS(5, _omitFieldNames ? '' : 'IBAN', protoName: 'IBAN')
    ..aOS(6, _omitFieldNames ? '' : 'BIC', protoName: 'BIC')
    ..aOS(7, _omitFieldNames ? '' : 'paypalAccount')
    ..aOS(8, _omitFieldNames ? '' : 'paypalId')
    ..aOS(9, _omitFieldNames ? '' : 'paymentSystem')
    ..aOS(10, _omitFieldNames ? '' : 'type')
    ..aOS(11, _omitFieldNames ? '' : 'creator')
    ..aOM<$27.Timestamp>(12, _omitFieldNames ? '' : 'created', subBuilder: $27.Timestamp.create)
    ..aOS(13, _omitFieldNames ? '' : 'changer')
    ..aOM<$27.Timestamp>(14, _omitFieldNames ? '' : 'changed', subBuilder: $27.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payment copyWith(void Function(Payment) updates) => super.copyWith((message) => updates(message as Payment)) as Payment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get accountId => $_getI64(1);
  @$pb.TagNumber(2)
  set accountId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get paymentCategory => $_getSZ(2);
  @$pb.TagNumber(3)
  set paymentCategory($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaymentCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentCategory() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get bankname => $_getSZ(3);
  @$pb.TagNumber(4)
  set bankname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBankname() => $_has(3);
  @$pb.TagNumber(4)
  void clearBankname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get iBAN => $_getSZ(4);
  @$pb.TagNumber(5)
  set iBAN($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIBAN() => $_has(4);
  @$pb.TagNumber(5)
  void clearIBAN() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get bIC => $_getSZ(5);
  @$pb.TagNumber(6)
  set bIC($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBIC() => $_has(5);
  @$pb.TagNumber(6)
  void clearBIC() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get paypalAccount => $_getSZ(6);
  @$pb.TagNumber(7)
  set paypalAccount($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPaypalAccount() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaypalAccount() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get paypalId => $_getSZ(7);
  @$pb.TagNumber(8)
  set paypalId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPaypalId() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaypalId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get paymentSystem => $_getSZ(8);
  @$pb.TagNumber(9)
  set paymentSystem($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPaymentSystem() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentSystem() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get creator => $_getSZ(10);
  @$pb.TagNumber(11)
  set creator($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreator() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreator() => clearField(11);

  @$pb.TagNumber(12)
  $27.Timestamp get created => $_getN(11);
  @$pb.TagNumber(12)
  set created($27.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCreated() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreated() => clearField(12);
  @$pb.TagNumber(12)
  $27.Timestamp ensureCreated() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get changer => $_getSZ(12);
  @$pb.TagNumber(13)
  set changer($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasChanger() => $_has(12);
  @$pb.TagNumber(13)
  void clearChanger() => clearField(13);

  @$pb.TagNumber(14)
  $27.Timestamp get changed => $_getN(13);
  @$pb.TagNumber(14)
  set changed($27.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasChanged() => $_has(13);
  @$pb.TagNumber(14)
  void clearChanged() => clearField(14);
  @$pb.TagNumber(14)
  $27.Timestamp ensureChanged() => $_ensure(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
