//
//  Generated code. Do not modify.
//  source: rpc_update_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account_info.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $0;

class UpdateAccountInfoRequest extends $pb.GeneratedMessage {
  factory UpdateAccountInfoRequest({
    $fixnum.Int64? accountId,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? street,
    $core.String? city,
    $core.String? zip,
    $core.String? country,
    $core.String? phone,
    $0.Timestamp? birthday,
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
    if (phone != null) {
      $result.phone = phone;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    return $result;
  }
  UpdateAccountInfoRequest._() : super();
  factory UpdateAccountInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'firstname')
    ..aOS(5, _omitFieldNames ? '' : 'lastname')
    ..aOS(6, _omitFieldNames ? '' : 'street')
    ..aOS(7, _omitFieldNames ? '' : 'city')
    ..aOS(8, _omitFieldNames ? '' : 'zip')
    ..aOS(9, _omitFieldNames ? '' : 'country')
    ..aOS(10, _omitFieldNames ? '' : 'phone')
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'birthday', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountInfoRequest clone() => UpdateAccountInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountInfoRequest copyWith(void Function(UpdateAccountInfoRequest) updates) => super.copyWith((message) => updates(message as UpdateAccountInfoRequest)) as UpdateAccountInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountInfoRequest create() => UpdateAccountInfoRequest._();
  UpdateAccountInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountInfoRequest> createRepeated() => $pb.PbList<UpdateAccountInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountInfoRequest>(create);
  static UpdateAccountInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(4)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(4)
  set firstname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(4)
  void clearFirstname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(5)
  set lastname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(5)
  void clearLastname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get street => $_getSZ(3);
  @$pb.TagNumber(6)
  set street($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasStreet() => $_has(3);
  @$pb.TagNumber(6)
  void clearStreet() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(7)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(7)
  void clearCity() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get zip => $_getSZ(5);
  @$pb.TagNumber(8)
  set zip($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasZip() => $_has(5);
  @$pb.TagNumber(8)
  void clearZip() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(9)
  set country($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(9)
  void clearCountry() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get phone => $_getSZ(7);
  @$pb.TagNumber(10)
  set phone($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasPhone() => $_has(7);
  @$pb.TagNumber(10)
  void clearPhone() => clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get birthday => $_getN(8);
  @$pb.TagNumber(11)
  set birthday($0.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasBirthday() => $_has(8);
  @$pb.TagNumber(11)
  void clearBirthday() => clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureBirthday() => $_ensure(8);
}

class UpdateAccountInfoResponse extends $pb.GeneratedMessage {
  factory UpdateAccountInfoResponse({
    $1.AccountInfo? accountInfo,
  }) {
    final $result = create();
    if (accountInfo != null) {
      $result.accountInfo = accountInfo;
    }
    return $result;
  }
  UpdateAccountInfoResponse._() : super();
  factory UpdateAccountInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$1.AccountInfo>(1, _omitFieldNames ? '' : 'accountInfo', subBuilder: $1.AccountInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountInfoResponse clone() => UpdateAccountInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountInfoResponse copyWith(void Function(UpdateAccountInfoResponse) updates) => super.copyWith((message) => updates(message as UpdateAccountInfoResponse)) as UpdateAccountInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountInfoResponse create() => UpdateAccountInfoResponse._();
  UpdateAccountInfoResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountInfoResponse> createRepeated() => $pb.PbList<UpdateAccountInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountInfoResponse>(create);
  static UpdateAccountInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.AccountInfo get accountInfo => $_getN(0);
  @$pb.TagNumber(1)
  set accountInfo($1.AccountInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.AccountInfo ensureAccountInfo() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
