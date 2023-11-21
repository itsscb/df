//
//  Generated code. Do not modify.
//  source: account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $30;

class AccountInfo extends $pb.GeneratedMessage {
  factory AccountInfo({
    $fixnum.Int64? accountId,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? street,
    $core.String? city,
    $core.String? zip,
    $core.String? country,
    $30.Timestamp? birthday,
    $core.String? phone,
    $core.bool? privacyAccepted,
    $30.Timestamp? privacyAcceptedDate,
    $core.int? permissionLevel,
    $core.String? creator,
    $30.Timestamp? created,
    $core.String? changer,
    $30.Timestamp? changed,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    if (firstname != null) {
      $result.firstname = firstname;
    }
    if (lastname != null) {
      $result.lastname = lastname;
    }
    if (street != null) {
      $result.street = street;
    }
    if (city != null) {
      $result.city = city;
    }
    if (zip != null) {
      $result.zip = zip;
    }
    if (country != null) {
      $result.country = country;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (privacyAccepted != null) {
      $result.privacyAccepted = privacyAccepted;
    }
    if (privacyAcceptedDate != null) {
      $result.privacyAcceptedDate = privacyAcceptedDate;
    }
    if (permissionLevel != null) {
      $result.permissionLevel = permissionLevel;
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
  AccountInfo._() : super();
  factory AccountInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOS(5, _omitFieldNames ? '' : 'street')
    ..aOS(6, _omitFieldNames ? '' : 'city')
    ..aOS(7, _omitFieldNames ? '' : 'zip')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..aOM<$30.Timestamp>(9, _omitFieldNames ? '' : 'birthday', subBuilder: $30.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'phone')
    ..aOB(11, _omitFieldNames ? '' : 'privacyAccepted')
    ..aOM<$30.Timestamp>(12, _omitFieldNames ? '' : 'privacyAcceptedDate', subBuilder: $30.Timestamp.create)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'permissionLevel', $pb.PbFieldType.O3)
    ..aOS(14, _omitFieldNames ? '' : 'creator')
    ..aOM<$30.Timestamp>(15, _omitFieldNames ? '' : 'created', subBuilder: $30.Timestamp.create)
    ..aOS(16, _omitFieldNames ? '' : 'changer')
    ..aOM<$30.Timestamp>(17, _omitFieldNames ? '' : 'changed', subBuilder: $30.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountInfo clone() => AccountInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountInfo copyWith(void Function(AccountInfo) updates) => super.copyWith((message) => updates(message as AccountInfo)) as AccountInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountInfo create() => AccountInfo._();
  AccountInfo createEmptyInstance() => create();
  static $pb.PbList<AccountInfo> createRepeated() => $pb.PbList<AccountInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountInfo>(create);
  static AccountInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(3)
  set firstname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(3)
  void clearFirstname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(4)
  set lastname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(4)
  void clearLastname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get street => $_getSZ(3);
  @$pb.TagNumber(5)
  set street($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasStreet() => $_has(3);
  @$pb.TagNumber(5)
  void clearStreet() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(6)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(6)
  void clearCity() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get zip => $_getSZ(5);
  @$pb.TagNumber(7)
  set zip($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasZip() => $_has(5);
  @$pb.TagNumber(7)
  void clearZip() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(8)
  set country($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(8)
  void clearCountry() => clearField(8);

  @$pb.TagNumber(9)
  $30.Timestamp get birthday => $_getN(7);
  @$pb.TagNumber(9)
  set birthday($30.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBirthday() => $_has(7);
  @$pb.TagNumber(9)
  void clearBirthday() => clearField(9);
  @$pb.TagNumber(9)
  $30.Timestamp ensureBirthday() => $_ensure(7);

  @$pb.TagNumber(10)
  $core.String get phone => $_getSZ(8);
  @$pb.TagNumber(10)
  set phone($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasPhone() => $_has(8);
  @$pb.TagNumber(10)
  void clearPhone() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get privacyAccepted => $_getBF(9);
  @$pb.TagNumber(11)
  set privacyAccepted($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasPrivacyAccepted() => $_has(9);
  @$pb.TagNumber(11)
  void clearPrivacyAccepted() => clearField(11);

  @$pb.TagNumber(12)
  $30.Timestamp get privacyAcceptedDate => $_getN(10);
  @$pb.TagNumber(12)
  set privacyAcceptedDate($30.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasPrivacyAcceptedDate() => $_has(10);
  @$pb.TagNumber(12)
  void clearPrivacyAcceptedDate() => clearField(12);
  @$pb.TagNumber(12)
  $30.Timestamp ensurePrivacyAcceptedDate() => $_ensure(10);

  @$pb.TagNumber(13)
  $core.int get permissionLevel => $_getIZ(11);
  @$pb.TagNumber(13)
  set permissionLevel($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasPermissionLevel() => $_has(11);
  @$pb.TagNumber(13)
  void clearPermissionLevel() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get creator => $_getSZ(12);
  @$pb.TagNumber(14)
  set creator($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasCreator() => $_has(12);
  @$pb.TagNumber(14)
  void clearCreator() => clearField(14);

  @$pb.TagNumber(15)
  $30.Timestamp get created => $_getN(13);
  @$pb.TagNumber(15)
  set created($30.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreated() => $_has(13);
  @$pb.TagNumber(15)
  void clearCreated() => clearField(15);
  @$pb.TagNumber(15)
  $30.Timestamp ensureCreated() => $_ensure(13);

  @$pb.TagNumber(16)
  $core.String get changer => $_getSZ(14);
  @$pb.TagNumber(16)
  set changer($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasChanger() => $_has(14);
  @$pb.TagNumber(16)
  void clearChanger() => clearField(16);

  @$pb.TagNumber(17)
  $30.Timestamp get changed => $_getN(15);
  @$pb.TagNumber(17)
  set changed($30.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasChanged() => $_has(15);
  @$pb.TagNumber(17)
  void clearChanged() => clearField(17);
  @$pb.TagNumber(17)
  $30.Timestamp ensureChanged() => $_ensure(15);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
