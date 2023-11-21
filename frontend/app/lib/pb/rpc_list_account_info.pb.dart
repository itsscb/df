//
//  Generated code. Do not modify.
//  source: rpc_list_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'account_info.pb.dart' as $32;

class ListAccountInfoRequest extends $pb.GeneratedMessage {
  factory ListAccountInfoRequest({
    $core.int? pageId,
    $core.int? pageSize,
  }) {
    final $result = create();
    if (pageId != null) {
      $result.pageId = pageId;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    return $result;
  }
  ListAccountInfoRequest._() : super();
  factory ListAccountInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAccountInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageId', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountInfoRequest clone() => ListAccountInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountInfoRequest copyWith(void Function(ListAccountInfoRequest) updates) => super.copyWith((message) => updates(message as ListAccountInfoRequest)) as ListAccountInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountInfoRequest create() => ListAccountInfoRequest._();
  ListAccountInfoRequest createEmptyInstance() => create();
  static $pb.PbList<ListAccountInfoRequest> createRepeated() => $pb.PbList<ListAccountInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAccountInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountInfoRequest>(create);
  static ListAccountInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);
}

class ListAccountInfoResponse extends $pb.GeneratedMessage {
  factory ListAccountInfoResponse({
    $core.Iterable<$32.AccountInfo>? accountInfo,
  }) {
    final $result = create();
    if (accountInfo != null) {
      $result.accountInfo.addAll(accountInfo);
    }
    return $result;
  }
  ListAccountInfoResponse._() : super();
  factory ListAccountInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAccountInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAccountInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$32.AccountInfo>(1, _omitFieldNames ? '' : 'accountInfo', $pb.PbFieldType.PM, subBuilder: $32.AccountInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAccountInfoResponse clone() => ListAccountInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAccountInfoResponse copyWith(void Function(ListAccountInfoResponse) updates) => super.copyWith((message) => updates(message as ListAccountInfoResponse)) as ListAccountInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAccountInfoResponse create() => ListAccountInfoResponse._();
  ListAccountInfoResponse createEmptyInstance() => create();
  static $pb.PbList<ListAccountInfoResponse> createRepeated() => $pb.PbList<ListAccountInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAccountInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAccountInfoResponse>(create);
  static ListAccountInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$32.AccountInfo> get accountInfo => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
