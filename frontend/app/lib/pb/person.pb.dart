//
//  Generated code. Do not modify.
//  source: person.proto
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

class Person extends $pb.GeneratedMessage {
  factory Person({
    $fixnum.Int64? id,
    $fixnum.Int64? accountId,
    $core.String? firstname,
    $core.String? lastname,
    $core.String? street,
    $core.String? city,
    $core.String? zip,
    $core.String? country,
    $27.Timestamp? birthday,
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
  Person._() : super();
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Person', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'firstname')
    ..aOS(4, _omitFieldNames ? '' : 'lastname')
    ..aOS(5, _omitFieldNames ? '' : 'street')
    ..aOS(6, _omitFieldNames ? '' : 'city')
    ..aOS(7, _omitFieldNames ? '' : 'zip')
    ..aOS(8, _omitFieldNames ? '' : 'country')
    ..aOM<$27.Timestamp>(9, _omitFieldNames ? '' : 'birthday', subBuilder: $27.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'creator')
    ..aOM<$27.Timestamp>(11, _omitFieldNames ? '' : 'created', subBuilder: $27.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'changer')
    ..aOM<$27.Timestamp>(13, _omitFieldNames ? '' : 'changed', subBuilder: $27.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person)) as Person;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

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
  $core.String get firstname => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstname() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastname => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastname() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get street => $_getSZ(4);
  @$pb.TagNumber(5)
  set street($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStreet() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreet() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get city => $_getSZ(5);
  @$pb.TagNumber(6)
  set city($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearCity() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get zip => $_getSZ(6);
  @$pb.TagNumber(7)
  set zip($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasZip() => $_has(6);
  @$pb.TagNumber(7)
  void clearZip() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get country => $_getSZ(7);
  @$pb.TagNumber(8)
  set country($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCountry() => $_has(7);
  @$pb.TagNumber(8)
  void clearCountry() => clearField(8);

  @$pb.TagNumber(9)
  $27.Timestamp get birthday => $_getN(8);
  @$pb.TagNumber(9)
  set birthday($27.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBirthday() => $_has(8);
  @$pb.TagNumber(9)
  void clearBirthday() => clearField(9);
  @$pb.TagNumber(9)
  $27.Timestamp ensureBirthday() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get creator => $_getSZ(9);
  @$pb.TagNumber(10)
  set creator($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreator() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreator() => clearField(10);

  @$pb.TagNumber(11)
  $27.Timestamp get created => $_getN(10);
  @$pb.TagNumber(11)
  set created($27.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreated() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreated() => clearField(11);
  @$pb.TagNumber(11)
  $27.Timestamp ensureCreated() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get changer => $_getSZ(11);
  @$pb.TagNumber(12)
  set changer($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasChanger() => $_has(11);
  @$pb.TagNumber(12)
  void clearChanger() => clearField(12);

  @$pb.TagNumber(13)
  $27.Timestamp get changed => $_getN(12);
  @$pb.TagNumber(13)
  set changed($27.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasChanged() => $_has(12);
  @$pb.TagNumber(13)
  void clearChanged() => clearField(13);
  @$pb.TagNumber(13)
  $27.Timestamp ensureChanged() => $_ensure(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
