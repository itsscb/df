//
//  Generated code. Do not modify.
//  source: returns_log.proto
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

class ReturnsLog extends $pb.GeneratedMessage {
  factory ReturnsLog({
    $fixnum.Int64? id,
    $fixnum.Int64? returnId,
    $fixnum.Int64? mailId,
    $core.String? status,
    $core.String? creator,
    $27.Timestamp? created,
    $core.String? changer,
    $27.Timestamp? changed,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (returnId != null) {
      $result.returnId = returnId;
    }
    if (mailId != null) {
      $result.mailId = mailId;
    }
    if (status != null) {
      $result.status = status;
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
  ReturnsLog._() : super();
  factory ReturnsLog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReturnsLog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReturnsLog', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'returnId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'mailId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'creator')
    ..aOM<$27.Timestamp>(6, _omitFieldNames ? '' : 'created', subBuilder: $27.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'changer')
    ..aOM<$27.Timestamp>(8, _omitFieldNames ? '' : 'changed', subBuilder: $27.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReturnsLog clone() => ReturnsLog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReturnsLog copyWith(void Function(ReturnsLog) updates) => super.copyWith((message) => updates(message as ReturnsLog)) as ReturnsLog;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReturnsLog create() => ReturnsLog._();
  ReturnsLog createEmptyInstance() => create();
  static $pb.PbList<ReturnsLog> createRepeated() => $pb.PbList<ReturnsLog>();
  @$core.pragma('dart2js:noInline')
  static ReturnsLog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReturnsLog>(create);
  static ReturnsLog? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get returnId => $_getI64(1);
  @$pb.TagNumber(2)
  set returnId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReturnId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get mailId => $_getI64(2);
  @$pb.TagNumber(3)
  set mailId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMailId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMailId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get creator => $_getSZ(4);
  @$pb.TagNumber(5)
  set creator($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreator() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreator() => clearField(5);

  @$pb.TagNumber(6)
  $27.Timestamp get created => $_getN(5);
  @$pb.TagNumber(6)
  set created($27.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreated() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreated() => clearField(6);
  @$pb.TagNumber(6)
  $27.Timestamp ensureCreated() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get changer => $_getSZ(6);
  @$pb.TagNumber(7)
  set changer($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasChanger() => $_has(6);
  @$pb.TagNumber(7)
  void clearChanger() => clearField(7);

  @$pb.TagNumber(8)
  $27.Timestamp get changed => $_getN(7);
  @$pb.TagNumber(8)
  set changed($27.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasChanged() => $_has(7);
  @$pb.TagNumber(8)
  void clearChanged() => clearField(8);
  @$pb.TagNumber(8)
  $27.Timestamp ensureChanged() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
