//
//  Generated code. Do not modify.
//  source: document.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;

class Document extends $pb.GeneratedMessage {
  factory Document({
    $fixnum.Int64? personId,
    $fixnum.Int64? mailId,
    $core.String? name,
    $core.String? type,
    $core.String? path,
    $core.String? url,
    $core.bool? valid,
    $core.String? validatedBy,
    $0.Timestamp? validDate,
    $core.String? creator,
    $0.Timestamp? created,
    $core.String? changer,
    $0.Timestamp? changed,
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (personId != null) {
      $result.personId = personId;
    }
    if (mailId != null) {
      $result.mailId = mailId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (path != null) {
      $result.path = path;
    }
    if (url != null) {
      $result.url = url;
    }
    if (valid != null) {
      $result.valid = valid;
    }
    if (validatedBy != null) {
      $result.validatedBy = validatedBy;
    }
    if (validDate != null) {
      $result.validDate = validDate;
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
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  Document._() : super();
  factory Document.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Document.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Document', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'mailId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'path')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..aOB(7, _omitFieldNames ? '' : 'valid')
    ..aOS(8, _omitFieldNames ? '' : 'validatedBy')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'validDate', subBuilder: $0.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'creator')
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'created', subBuilder: $0.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'changer')
    ..aOM<$0.Timestamp>(13, _omitFieldNames ? '' : 'changed', subBuilder: $0.Timestamp.create)
    ..a<$fixnum.Int64>(14, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Document clone() => Document()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Document copyWith(void Function(Document) updates) => super.copyWith((message) => updates(message as Document)) as Document;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Document create() => Document._();
  Document createEmptyInstance() => create();
  static $pb.PbList<Document> createRepeated() => $pb.PbList<Document>();
  @$core.pragma('dart2js:noInline')
  static Document getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Document>(create);
  static Document? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get personId => $_getI64(0);
  @$pb.TagNumber(1)
  set personId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mailId => $_getI64(1);
  @$pb.TagNumber(2)
  set mailId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMailId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMailId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get path => $_getSZ(4);
  @$pb.TagNumber(5)
  set path($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearPath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get valid => $_getBF(6);
  @$pb.TagNumber(7)
  set valid($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasValid() => $_has(6);
  @$pb.TagNumber(7)
  void clearValid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get validatedBy => $_getSZ(7);
  @$pb.TagNumber(8)
  set validatedBy($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasValidatedBy() => $_has(7);
  @$pb.TagNumber(8)
  void clearValidatedBy() => clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get validDate => $_getN(8);
  @$pb.TagNumber(9)
  set validDate($0.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasValidDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearValidDate() => clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureValidDate() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get creator => $_getSZ(9);
  @$pb.TagNumber(10)
  set creator($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreator() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreator() => clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get created => $_getN(10);
  @$pb.TagNumber(11)
  set created($0.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreated() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreated() => clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureCreated() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get changer => $_getSZ(11);
  @$pb.TagNumber(12)
  set changer($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasChanger() => $_has(11);
  @$pb.TagNumber(12)
  void clearChanger() => clearField(12);

  @$pb.TagNumber(13)
  $0.Timestamp get changed => $_getN(12);
  @$pb.TagNumber(13)
  set changed($0.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasChanged() => $_has(12);
  @$pb.TagNumber(13)
  void clearChanged() => clearField(13);
  @$pb.TagNumber(13)
  $0.Timestamp ensureChanged() => $_ensure(12);

  @$pb.TagNumber(14)
  $fixnum.Int64 get id => $_getI64(13);
  @$pb.TagNumber(14)
  set id($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(13);
  @$pb.TagNumber(14)
  void clearId() => clearField(14);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
