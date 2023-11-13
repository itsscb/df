//
//  Generated code. Do not modify.
//  source: rpc_update_account_privacy.proto
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

class UpdateAccountPrivacyRequest extends $pb.GeneratedMessage {
  factory UpdateAccountPrivacyRequest({
    $fixnum.Int64? accountId,
    $core.bool? privacyAccepted,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    if (privacyAccepted != null) {
      $result.privacyAccepted = privacyAccepted;
    }
    return $result;
  }
  UpdateAccountPrivacyRequest._() : super();
  factory UpdateAccountPrivacyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountPrivacyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountPrivacyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'privacyAccepted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountPrivacyRequest clone() => UpdateAccountPrivacyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountPrivacyRequest copyWith(void Function(UpdateAccountPrivacyRequest) updates) => super.copyWith((message) => updates(message as UpdateAccountPrivacyRequest)) as UpdateAccountPrivacyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountPrivacyRequest create() => UpdateAccountPrivacyRequest._();
  UpdateAccountPrivacyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountPrivacyRequest> createRepeated() => $pb.PbList<UpdateAccountPrivacyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountPrivacyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountPrivacyRequest>(create);
  static UpdateAccountPrivacyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get privacyAccepted => $_getBF(1);
  @$pb.TagNumber(2)
  set privacyAccepted($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivacyAccepted() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivacyAccepted() => clearField(2);
}

class UpdateAccountPrivacyResponse extends $pb.GeneratedMessage {
  factory UpdateAccountPrivacyResponse({
    $29.AccountInfo? accountInfo,
  }) {
    final $result = create();
    if (accountInfo != null) {
      $result.accountInfo = accountInfo;
    }
    return $result;
  }
  UpdateAccountPrivacyResponse._() : super();
  factory UpdateAccountPrivacyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccountPrivacyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccountPrivacyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$29.AccountInfo>(1, _omitFieldNames ? '' : 'accountInfo', subBuilder: $29.AccountInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccountPrivacyResponse clone() => UpdateAccountPrivacyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccountPrivacyResponse copyWith(void Function(UpdateAccountPrivacyResponse) updates) => super.copyWith((message) => updates(message as UpdateAccountPrivacyResponse)) as UpdateAccountPrivacyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccountPrivacyResponse create() => UpdateAccountPrivacyResponse._();
  UpdateAccountPrivacyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAccountPrivacyResponse> createRepeated() => $pb.PbList<UpdateAccountPrivacyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccountPrivacyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccountPrivacyResponse>(create);
  static UpdateAccountPrivacyResponse? _defaultInstance;

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
