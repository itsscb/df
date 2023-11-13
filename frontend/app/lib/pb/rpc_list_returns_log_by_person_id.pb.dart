//
//  Generated code. Do not modify.
//  source: rpc_list_returns_log_by_person_id.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'returns_log.pb.dart' as $33;

class ListReturnsLogRequest extends $pb.GeneratedMessage {
  factory ListReturnsLogRequest({
    $fixnum.Int64? personId,
  }) {
    final $result = create();
    if (personId != null) {
      $result.personId = personId;
    }
    return $result;
  }
  ListReturnsLogRequest._() : super();
  factory ListReturnsLogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListReturnsLogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListReturnsLogRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListReturnsLogRequest clone() => ListReturnsLogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListReturnsLogRequest copyWith(void Function(ListReturnsLogRequest) updates) => super.copyWith((message) => updates(message as ListReturnsLogRequest)) as ListReturnsLogRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReturnsLogRequest create() => ListReturnsLogRequest._();
  ListReturnsLogRequest createEmptyInstance() => create();
  static $pb.PbList<ListReturnsLogRequest> createRepeated() => $pb.PbList<ListReturnsLogRequest>();
  @$core.pragma('dart2js:noInline')
  static ListReturnsLogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListReturnsLogRequest>(create);
  static ListReturnsLogRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get personId => $_getI64(0);
  @$pb.TagNumber(1)
  set personId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);
}

class ListReturnsLogResponse extends $pb.GeneratedMessage {
  factory ListReturnsLogResponse({
    $core.Iterable<$33.ReturnsLog>? returnsLog,
  }) {
    final $result = create();
    if (returnsLog != null) {
      $result.returnsLog.addAll(returnsLog);
    }
    return $result;
  }
  ListReturnsLogResponse._() : super();
  factory ListReturnsLogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListReturnsLogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListReturnsLogResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$33.ReturnsLog>(1, _omitFieldNames ? '' : 'returnsLog', $pb.PbFieldType.PM, subBuilder: $33.ReturnsLog.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListReturnsLogResponse clone() => ListReturnsLogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListReturnsLogResponse copyWith(void Function(ListReturnsLogResponse) updates) => super.copyWith((message) => updates(message as ListReturnsLogResponse)) as ListReturnsLogResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReturnsLogResponse create() => ListReturnsLogResponse._();
  ListReturnsLogResponse createEmptyInstance() => create();
  static $pb.PbList<ListReturnsLogResponse> createRepeated() => $pb.PbList<ListReturnsLogResponse>();
  @$core.pragma('dart2js:noInline')
  static ListReturnsLogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListReturnsLogResponse>(create);
  static ListReturnsLogResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$33.ReturnsLog> get returnsLog => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
