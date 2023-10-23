//
//  Generated code. Do not modify.
//  source: rpc_get_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'payment.pb.dart' as $3;

class GetPaymentRequest extends $pb.GeneratedMessage {
  factory GetPaymentRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetPaymentRequest._() : super();
  factory GetPaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentRequest clone() => GetPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentRequest copyWith(void Function(GetPaymentRequest) updates) => super.copyWith((message) => updates(message as GetPaymentRequest)) as GetPaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest create() => GetPaymentRequest._();
  GetPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<GetPaymentRequest> createRepeated() => $pb.PbList<GetPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentRequest>(create);
  static GetPaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetPaymentResponse extends $pb.GeneratedMessage {
  factory GetPaymentResponse({
    $3.Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  GetPaymentResponse._() : super();
  factory GetPaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$3.Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: $3.Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentResponse clone() => GetPaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentResponse copyWith(void Function(GetPaymentResponse) updates) => super.copyWith((message) => updates(message as GetPaymentResponse)) as GetPaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse create() => GetPaymentResponse._();
  GetPaymentResponse createEmptyInstance() => create();
  static $pb.PbList<GetPaymentResponse> createRepeated() => $pb.PbList<GetPaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentResponse>(create);
  static GetPaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment($3.Payment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => clearField(1);
  @$pb.TagNumber(1)
  $3.Payment ensurePayment() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
