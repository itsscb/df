//
//  Generated code. Do not modify.
//  source: rpc_add_emails.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'email_address.pb.dart' as $31;

class AddEmailAddressesRequest extends $pb.GeneratedMessage {
  factory AddEmailAddressesRequest({
    $fixnum.Int64? personId,
    $core.Iterable<$core.String>? email,
  }) {
    final $result = create();
    if (personId != null) {
      $result.personId = personId;
    }
    if (email != null) {
      $result.email.addAll(email);
    }
    return $result;
  }
  AddEmailAddressesRequest._() : super();
  factory AddEmailAddressesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailAddressesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailAddressesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPS(2, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailAddressesRequest clone() => AddEmailAddressesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailAddressesRequest copyWith(void Function(AddEmailAddressesRequest) updates) => super.copyWith((message) => updates(message as AddEmailAddressesRequest)) as AddEmailAddressesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailAddressesRequest create() => AddEmailAddressesRequest._();
  AddEmailAddressesRequest createEmptyInstance() => create();
  static $pb.PbList<AddEmailAddressesRequest> createRepeated() => $pb.PbList<AddEmailAddressesRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEmailAddressesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailAddressesRequest>(create);
  static AddEmailAddressesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get personId => $_getI64(0);
  @$pb.TagNumber(1)
  set personId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get email => $_getList(1);
}

class AddEmailAddressesResponse extends $pb.GeneratedMessage {
  factory AddEmailAddressesResponse({
    $core.Iterable<$31.EmailAddress>? emails,
  }) {
    final $result = create();
    if (emails != null) {
      $result.emails.addAll(emails);
    }
    return $result;
  }
  AddEmailAddressesResponse._() : super();
  factory AddEmailAddressesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailAddressesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailAddressesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$31.EmailAddress>(1, _omitFieldNames ? '' : 'emails', $pb.PbFieldType.PM, subBuilder: $31.EmailAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailAddressesResponse clone() => AddEmailAddressesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailAddressesResponse copyWith(void Function(AddEmailAddressesResponse) updates) => super.copyWith((message) => updates(message as AddEmailAddressesResponse)) as AddEmailAddressesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailAddressesResponse create() => AddEmailAddressesResponse._();
  AddEmailAddressesResponse createEmptyInstance() => create();
  static $pb.PbList<AddEmailAddressesResponse> createRepeated() => $pb.PbList<AddEmailAddressesResponse>();
  @$core.pragma('dart2js:noInline')
  static AddEmailAddressesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailAddressesResponse>(create);
  static AddEmailAddressesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$31.EmailAddress> get emails => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
