//
//  Generated code. Do not modify.
//  source: account.proto
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

class Account extends $pb.GeneratedMessage {
  factory Account({
    $fixnum.Int64? id,
    $core.String? email,
    $core.String? secretKey,
    $27.Timestamp? emailVerifiedTime,
    $core.bool? emailVerified,
    $27.Timestamp? privacyAcceptedDate,
    $core.int? permissionLevel,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (email != null) {
      $result.email = email;
    }
    if (secretKey != null) {
      $result.secretKey = secretKey;
    }
    if (emailVerifiedTime != null) {
      $result.emailVerifiedTime = emailVerifiedTime;
    }
    if (emailVerified != null) {
      $result.emailVerified = emailVerified;
    }
    if (privacyAcceptedDate != null) {
      $result.privacyAcceptedDate = privacyAcceptedDate;
    }
    if (permissionLevel != null) {
      $result.permissionLevel = permissionLevel;
    }
    return $result;
  }
  Account._() : super();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Account', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'secretKey')
    ..aOM<$27.Timestamp>(9, _omitFieldNames ? '' : 'emailVerifiedTime', subBuilder: $27.Timestamp.create)
    ..aOB(10, _omitFieldNames ? '' : 'emailVerified')
    ..aOM<$27.Timestamp>(12, _omitFieldNames ? '' : 'privacyAcceptedDate', subBuilder: $27.Timestamp.create)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'permissionLevel', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account clone() => Account()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account)) as Account;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secretKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set secretKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecretKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecretKey() => clearField(3);

  @$pb.TagNumber(9)
  $27.Timestamp get emailVerifiedTime => $_getN(3);
  @$pb.TagNumber(9)
  set emailVerifiedTime($27.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEmailVerifiedTime() => $_has(3);
  @$pb.TagNumber(9)
  void clearEmailVerifiedTime() => clearField(9);
  @$pb.TagNumber(9)
  $27.Timestamp ensureEmailVerifiedTime() => $_ensure(3);

  @$pb.TagNumber(10)
  $core.bool get emailVerified => $_getBF(4);
  @$pb.TagNumber(10)
  set emailVerified($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(10)
  $core.bool hasEmailVerified() => $_has(4);
  @$pb.TagNumber(10)
  void clearEmailVerified() => clearField(10);

  @$pb.TagNumber(12)
  $27.Timestamp get privacyAcceptedDate => $_getN(5);
  @$pb.TagNumber(12)
  set privacyAcceptedDate($27.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasPrivacyAcceptedDate() => $_has(5);
  @$pb.TagNumber(12)
  void clearPrivacyAcceptedDate() => clearField(12);
  @$pb.TagNumber(12)
  $27.Timestamp ensurePrivacyAcceptedDate() => $_ensure(5);

  @$pb.TagNumber(13)
  $core.int get permissionLevel => $_getIZ(6);
  @$pb.TagNumber(13)
  set permissionLevel($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(13)
  $core.bool hasPermissionLevel() => $_has(6);
  @$pb.TagNumber(13)
  void clearPermissionLevel() => clearField(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
