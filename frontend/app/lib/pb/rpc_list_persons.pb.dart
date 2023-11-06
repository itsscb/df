//
//  Generated code. Do not modify.
//  source: rpc_list_persons.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'person.pb.dart' as $31;

class ListPersonsRequest extends $pb.GeneratedMessage {
  factory ListPersonsRequest({
    $fixnum.Int64? accountId,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    return $result;
  }
  ListPersonsRequest._() : super();
  factory ListPersonsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPersonsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPersonsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPersonsRequest clone() => ListPersonsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPersonsRequest copyWith(void Function(ListPersonsRequest) updates) => super.copyWith((message) => updates(message as ListPersonsRequest)) as ListPersonsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPersonsRequest create() => ListPersonsRequest._();
  ListPersonsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPersonsRequest> createRepeated() => $pb.PbList<ListPersonsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPersonsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPersonsRequest>(create);
  static ListPersonsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class ListPersonsResponse extends $pb.GeneratedMessage {
  factory ListPersonsResponse({
    $core.Iterable<$31.Person>? persons,
  }) {
    final $result = create();
    if (persons != null) {
      $result.persons.addAll(persons);
    }
    return $result;
  }
  ListPersonsResponse._() : super();
  factory ListPersonsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPersonsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPersonsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$31.Person>(1, _omitFieldNames ? '' : 'persons', $pb.PbFieldType.PM, subBuilder: $31.Person.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPersonsResponse clone() => ListPersonsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPersonsResponse copyWith(void Function(ListPersonsResponse) updates) => super.copyWith((message) => updates(message as ListPersonsResponse)) as ListPersonsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPersonsResponse create() => ListPersonsResponse._();
  ListPersonsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPersonsResponse> createRepeated() => $pb.PbList<ListPersonsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPersonsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPersonsResponse>(create);
  static ListPersonsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$31.Person> get persons => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
