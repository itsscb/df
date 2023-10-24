//
//  Generated code. Do not modify.
//  source: rpc_get_person.proto
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

class GetPersonRequest extends $pb.GeneratedMessage {
  factory GetPersonRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetPersonRequest._() : super();
  factory GetPersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPersonRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonRequest clone() => GetPersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonRequest copyWith(void Function(GetPersonRequest) updates) => super.copyWith((message) => updates(message as GetPersonRequest)) as GetPersonRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonRequest create() => GetPersonRequest._();
  GetPersonRequest createEmptyInstance() => create();
  static $pb.PbList<GetPersonRequest> createRepeated() => $pb.PbList<GetPersonRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonRequest>(create);
  static GetPersonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetPersonResponse extends $pb.GeneratedMessage {
  factory GetPersonResponse({
    $31.Person? person,
  }) {
    final $result = create();
    if (person != null) {
      $result.person = person;
    }
    return $result;
  }
  GetPersonResponse._() : super();
  factory GetPersonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPersonResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.Person>(1, _omitFieldNames ? '' : 'person', subBuilder: $31.Person.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonResponse clone() => GetPersonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonResponse copyWith(void Function(GetPersonResponse) updates) => super.copyWith((message) => updates(message as GetPersonResponse)) as GetPersonResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonResponse create() => GetPersonResponse._();
  GetPersonResponse createEmptyInstance() => create();
  static $pb.PbList<GetPersonResponse> createRepeated() => $pb.PbList<GetPersonResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPersonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonResponse>(create);
  static GetPersonResponse? _defaultInstance;

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
