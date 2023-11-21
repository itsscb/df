//
//  Generated code. Do not modify.
//  source: rpc_resend_verification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $33;

class ResendVerificationRequest extends $pb.GeneratedMessage {
  factory ResendVerificationRequest({
    $fixnum.Int64? accountId,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    return $result;
  }
  ResendVerificationRequest._() : super();
  factory ResendVerificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendVerificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResendVerificationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendVerificationRequest clone() => ResendVerificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendVerificationRequest copyWith(void Function(ResendVerificationRequest) updates) => super.copyWith((message) => updates(message as ResendVerificationRequest)) as ResendVerificationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResendVerificationRequest create() => ResendVerificationRequest._();
  ResendVerificationRequest createEmptyInstance() => create();
  static $pb.PbList<ResendVerificationRequest> createRepeated() => $pb.PbList<ResendVerificationRequest>();
  @$core.pragma('dart2js:noInline')
  static ResendVerificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendVerificationRequest>(create);
  static ResendVerificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class ResendVerificationResponse extends $pb.GeneratedMessage {
  factory ResendVerificationResponse({
    $33.Account? account,
  }) {
    final $result = create();
    if (account != null) {
      $result.account = account;
    }
    return $result;
  }
  ResendVerificationResponse._() : super();
  factory ResendVerificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendVerificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResendVerificationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$33.Account>(1, _omitFieldNames ? '' : 'account', subBuilder: $33.Account.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendVerificationResponse clone() => ResendVerificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendVerificationResponse copyWith(void Function(ResendVerificationResponse) updates) => super.copyWith((message) => updates(message as ResendVerificationResponse)) as ResendVerificationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResendVerificationResponse create() => ResendVerificationResponse._();
  ResendVerificationResponse createEmptyInstance() => create();
  static $pb.PbList<ResendVerificationResponse> createRepeated() => $pb.PbList<ResendVerificationResponse>();
  @$core.pragma('dart2js:noInline')
  static ResendVerificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendVerificationResponse>(create);
  static ResendVerificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $33.Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($33.Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  $33.Account ensureAccount() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
