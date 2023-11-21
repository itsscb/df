//
//  Generated code. Do not modify.
//  source: rpc_create_person.proto
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
import 'person.pb.dart' as $35;

class CreatePersonRequest extends $pb.GeneratedMessage {
  factory CreatePersonRequest({
    $fixnum.Int64? accountId,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? street,
    $core.String? city,
    $core.String? zip,
    $core.String? country,
    $core.String? relationship,
    $30.Timestamp? birthday,
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
    if (relationship != null) {
      $result.relationship = relationship;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    return $result;
  }
  CreatePersonRequest._() : super();
  factory CreatePersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'firstname')
    ..aOS(3, _omitFieldNames ? '' : 'lastname')
    ..aOS(4, _omitFieldNames ? '' : 'street')
    ..aOS(5, _omitFieldNames ? '' : 'city')
    ..aOS(6, _omitFieldNames ? '' : 'zip')
    ..aOS(7, _omitFieldNames ? '' : 'country')
    ..aOS(8, _omitFieldNames ? '' : 'relationship')
    ..aOM<$30.Timestamp>(9, _omitFieldNames ? '' : 'birthday', subBuilder: $30.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonRequest clone() => CreatePersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonRequest copyWith(void Function(CreatePersonRequest) updates) => super.copyWith((message) => updates(message as CreatePersonRequest)) as CreatePersonRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonRequest create() => CreatePersonRequest._();
  CreatePersonRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePersonRequest> createRepeated() => $pb.PbList<CreatePersonRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonRequest>(create);
  static CreatePersonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get street => $_getSZ(3);
  @$pb.TagNumber(4)
  set street($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreet() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreet() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get city => $_getSZ(4);
  @$pb.TagNumber(5)
  set city($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearCity() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get zip => $_getSZ(5);
  @$pb.TagNumber(6)
  set zip($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasZip() => $_has(5);
  @$pb.TagNumber(6)
  void clearZip() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get country => $_getSZ(6);
  @$pb.TagNumber(7)
  set country($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCountry() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountry() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get relationship => $_getSZ(7);
  @$pb.TagNumber(8)
  set relationship($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRelationship() => $_has(7);
  @$pb.TagNumber(8)
  void clearRelationship() => clearField(8);

  @$pb.TagNumber(9)
  $30.Timestamp get birthday => $_getN(8);
  @$pb.TagNumber(9)
  set birthday($30.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBirthday() => $_has(8);
  @$pb.TagNumber(9)
  void clearBirthday() => clearField(9);
  @$pb.TagNumber(9)
  $30.Timestamp ensureBirthday() => $_ensure(8);
}

class CreatePersonResponse extends $pb.GeneratedMessage {
  factory CreatePersonResponse({
    $35.Person? person,
  }) {
    final $result = create();
    if (person != null) {
      $result.person = person;
    }
    return $result;
  }
  CreatePersonResponse._() : super();
  factory CreatePersonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$35.Person>(1, _omitFieldNames ? '' : 'person', subBuilder: $35.Person.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonResponse clone() => CreatePersonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonResponse copyWith(void Function(CreatePersonResponse) updates) => super.copyWith((message) => updates(message as CreatePersonResponse)) as CreatePersonResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonResponse create() => CreatePersonResponse._();
  CreatePersonResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePersonResponse> createRepeated() => $pb.PbList<CreatePersonResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonResponse>(create);
  static CreatePersonResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $35.Person get person => $_getN(0);
  @$pb.TagNumber(1)
  set person($35.Person v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerson() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerson() => clearField(1);
  @$pb.TagNumber(1)
  $35.Person ensurePerson() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
