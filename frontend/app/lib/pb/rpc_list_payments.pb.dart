//
//  Generated code. Do not modify.
//  source: rpc_list_payments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'payment.pb.dart' as $31;

class ListPaymentsRequest extends $pb.GeneratedMessage {
  factory ListPaymentsRequest({
    $fixnum.Int64? accountId,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    return $result;
  }
  ListPaymentsRequest._() : super();
  factory ListPaymentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPaymentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPaymentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'accountId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPaymentsRequest clone() => ListPaymentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPaymentsRequest copyWith(void Function(ListPaymentsRequest) updates) => super.copyWith((message) => updates(message as ListPaymentsRequest)) as ListPaymentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest create() => ListPaymentsRequest._();
  ListPaymentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsRequest> createRepeated() => $pb.PbList<ListPaymentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPaymentsRequest>(create);
  static ListPaymentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class ListPaymentsResponse extends $pb.GeneratedMessage {
  factory ListPaymentsResponse({
    $core.Iterable<$31.Payment>? payments,
  }) {
    final $result = create();
    if (payments != null) {
      $result.payments.addAll(payments);
    }
    return $result;
  }
  ListPaymentsResponse._() : super();
  factory ListPaymentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPaymentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPaymentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$31.Payment>(1, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM, subBuilder: $31.Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPaymentsResponse clone() => ListPaymentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPaymentsResponse copyWith(void Function(ListPaymentsResponse) updates) => super.copyWith((message) => updates(message as ListPaymentsResponse)) as ListPaymentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse create() => ListPaymentsResponse._();
  ListPaymentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsResponse> createRepeated() => $pb.PbList<ListPaymentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPaymentsResponse>(create);
  static ListPaymentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$31.Payment> get payments => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
