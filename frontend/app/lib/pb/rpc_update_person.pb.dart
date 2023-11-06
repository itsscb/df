//
//  Generated code. Do not modify.
//  source: rpc_update_person.proto
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
import 'person.pb.dart' as $31;

class UpdatePersonRequest extends $pb.GeneratedMessage {
  factory UpdatePersonRequest({
    $fixnum.Int64? id,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? street,
    $core.String? city,
    $core.String? zip,
    $core.String? country,
    $27.Timestamp? birthday,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
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
    return $result;
  }
  UpdatePersonRequest._() : super();
  factory UpdatePersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePersonRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'firstname')
    ..aOS(3, _omitFieldNames ? '' : 'lastname')
    ..aOS(4, _omitFieldNames ? '' : 'street')
    ..aOS(5, _omitFieldNames ? '' : 'city')
    ..aOS(6, _omitFieldNames ? '' : 'zip')
    ..aOS(7, _omitFieldNames ? '' : 'country')
    ..aOM<$27.Timestamp>(8, _omitFieldNames ? '' : 'birthday', subBuilder: $27.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePersonRequest clone() => UpdatePersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePersonRequest copyWith(void Function(UpdatePersonRequest) updates) => super.copyWith((message) => updates(message as UpdatePersonRequest)) as UpdatePersonRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePersonRequest create() => UpdatePersonRequest._();
  UpdatePersonRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePersonRequest> createRepeated() => $pb.PbList<UpdatePersonRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePersonRequest>(create);
  static UpdatePersonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $27.Timestamp get birthday => $_getN(7);
  @$pb.TagNumber(8)
  set birthday($27.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBirthday() => $_has(7);
  @$pb.TagNumber(8)
  void clearBirthday() => clearField(8);
  @$pb.TagNumber(8)
  $27.Timestamp ensureBirthday() => $_ensure(7);
}

class UpdatePersonResponse extends $pb.GeneratedMessage {
  factory UpdatePersonResponse({
    $31.Person? person,
  }) {
    final $result = create();
    if (person != null) {
      $result.person = person;
    }
    return $result;
  }
  UpdatePersonResponse._() : super();
  factory UpdatePersonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePersonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePersonResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.Person>(1, _omitFieldNames ? '' : 'person', subBuilder: $31.Person.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePersonResponse clone() => UpdatePersonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePersonResponse copyWith(void Function(UpdatePersonResponse) updates) => super.copyWith((message) => updates(message as UpdatePersonResponse)) as UpdatePersonResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePersonResponse create() => UpdatePersonResponse._();
  UpdatePersonResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePersonResponse> createRepeated() => $pb.PbList<UpdatePersonResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePersonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePersonResponse>(create);
  static UpdatePersonResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $31.Person get person => $_getN(0);
  @$pb.TagNumber(1)
  set person($31.Person v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerson() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerson() => clearField(1);
  @$pb.TagNumber(1)
  $31.Person ensurePerson() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
