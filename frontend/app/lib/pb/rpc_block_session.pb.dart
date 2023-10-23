//
//  Generated code. Do not modify.
//  source: rpc_block_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BlockSessionRequest extends $pb.GeneratedMessage {
  factory BlockSessionRequest({
    $core.String? sessionId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  BlockSessionRequest._() : super();
  factory BlockSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockSessionRequest clone() => BlockSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockSessionRequest copyWith(void Function(BlockSessionRequest) updates) => super.copyWith((message) => updates(message as BlockSessionRequest)) as BlockSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockSessionRequest create() => BlockSessionRequest._();
  BlockSessionRequest createEmptyInstance() => create();
  static $pb.PbList<BlockSessionRequest> createRepeated() => $pb.PbList<BlockSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static BlockSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockSessionRequest>(create);
  static BlockSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);
}

class BlockSessionResponse extends $pb.GeneratedMessage {
  factory BlockSessionResponse({
    $core.String? sessionId,
    $core.bool? blocked,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (blocked != null) {
      $result.blocked = blocked;
    }
    return $result;
  }
  BlockSessionResponse._() : super();
  factory BlockSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOB(2, _omitFieldNames ? '' : 'blocked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockSessionResponse clone() => BlockSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockSessionResponse copyWith(void Function(BlockSessionResponse) updates) => super.copyWith((message) => updates(message as BlockSessionResponse)) as BlockSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockSessionResponse create() => BlockSessionResponse._();
  BlockSessionResponse createEmptyInstance() => create();
  static $pb.PbList<BlockSessionResponse> createRepeated() => $pb.PbList<BlockSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static BlockSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockSessionResponse>(create);
  static BlockSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get blocked => $_getBF(1);
  @$pb.TagNumber(2)
  set blocked($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlocked() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
