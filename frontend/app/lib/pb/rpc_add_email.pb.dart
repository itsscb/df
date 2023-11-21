//
//  Generated code. Do not modify.
//  source: rpc_add_email.proto
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

class AddEmailAddressRequest extends $pb.GeneratedMessage {
  factory AddEmailAddressRequest({
    $fixnum.Int64? personId,
    $core.String? email,
  }) {
    final $result = create();
    if (personId != null) {
      $result.personId = personId;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AddEmailAddressRequest._() : super();
  factory AddEmailAddressRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailAddressRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailAddressRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailAddressRequest clone() => AddEmailAddressRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailAddressRequest copyWith(void Function(AddEmailAddressRequest) updates) => super.copyWith((message) => updates(message as AddEmailAddressRequest)) as AddEmailAddressRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailAddressRequest create() => AddEmailAddressRequest._();
  AddEmailAddressRequest createEmptyInstance() => create();
  static $pb.PbList<AddEmailAddressRequest> createRepeated() => $pb.PbList<AddEmailAddressRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEmailAddressRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailAddressRequest>(create);
  static AddEmailAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get personId => $_getI64(0);
  @$pb.TagNumber(1)
  set personId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);
}

class AddEmailAddressResponse extends $pb.GeneratedMessage {
  factory AddEmailAddressResponse({
    $31.EmailAddress? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AddEmailAddressResponse._() : super();
  factory AddEmailAddressResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailAddressResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailAddressResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.EmailAddress>(1, _omitFieldNames ? '' : 'email', subBuilder: $31.EmailAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailAddressResponse clone() => AddEmailAddressResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailAddressResponse copyWith(void Function(AddEmailAddressResponse) updates) => super.copyWith((message) => updates(message as AddEmailAddressResponse)) as AddEmailAddressResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailAddressResponse create() => AddEmailAddressResponse._();
  AddEmailAddressResponse createEmptyInstance() => create();
  static $pb.PbList<AddEmailAddressResponse> createRepeated() => $pb.PbList<AddEmailAddressResponse>();
  @$core.pragma('dart2js:noInline')
  static AddEmailAddressResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailAddressResponse>(create);
  static AddEmailAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $31.EmailAddress get email => $_getN(0);
  @$pb.TagNumber(1)
  set email($31.EmailAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
  @$pb.TagNumber(1)
  $31.EmailAddress ensureEmail() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
