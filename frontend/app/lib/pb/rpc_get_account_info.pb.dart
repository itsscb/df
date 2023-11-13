//
//  Generated code. Do not modify.
//  source: rpc_get_account_info.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account_info.pb.dart' as $29;

class GetAccountInfoRequest extends $pb.GeneratedMessage {
  factory GetAccountInfoRequest({
    $fixnum.Int64? accountId,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    return $result;
  }
  GetAccountInfoRequest._() : super();
  factory GetAccountInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccountInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountInfoRequest clone() => GetAccountInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountInfoRequest copyWith(void Function(GetAccountInfoRequest) updates) => super.copyWith((message) => updates(message as GetAccountInfoRequest)) as GetAccountInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountInfoRequest create() => GetAccountInfoRequest._();
  GetAccountInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountInfoRequest> createRepeated() => $pb.PbList<GetAccountInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountInfoRequest>(create);
  static GetAccountInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class GetAccountInfoResponse extends $pb.GeneratedMessage {
  factory GetAccountInfoResponse({
    $29.AccountInfo? accountInfo,
  }) {
    final $result = create();
    if (accountInfo != null) {
      $result.accountInfo = accountInfo;
    }
    return $result;
  }
  GetAccountInfoResponse._() : super();
  factory GetAccountInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccountInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$29.AccountInfo>(1, _omitFieldNames ? '' : 'accountInfo', subBuilder: $29.AccountInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountInfoResponse clone() => GetAccountInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountInfoResponse copyWith(void Function(GetAccountInfoResponse) updates) => super.copyWith((message) => updates(message as GetAccountInfoResponse)) as GetAccountInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountInfoResponse create() => GetAccountInfoResponse._();
  GetAccountInfoResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountInfoResponse> createRepeated() => $pb.PbList<GetAccountInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccountInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountInfoResponse>(create);
  static GetAccountInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $29.AccountInfo get accountInfo => $_getN(0);
  @$pb.TagNumber(1)
  set accountInfo($29.AccountInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountInfo() => clearField(1);
  @$pb.TagNumber(1)
  $29.AccountInfo ensureAccountInfo() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
