//
//  Generated code. Do not modify.
//  source: rpc_upload_document.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'document.pb.dart' as $34;

class UploadDocumentRequest extends $pb.GeneratedMessage {
  factory UploadDocumentRequest({
    $core.List<$core.int>? file,
    $fixnum.Int64? personId,
    $fixnum.Int64? mailId,
  }) {
    final $result = create();
    if (file != null) {
      $result.file = file;
    }
    if (personId != null) {
      $result.personId = personId;
    }
    if (mailId != null) {
      $result.mailId = mailId;
    }
    return $result;
  }
  UploadDocumentRequest._() : super();
  factory UploadDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'file', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'personId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'mailId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadDocumentRequest clone() => UploadDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadDocumentRequest copyWith(void Function(UploadDocumentRequest) updates) => super.copyWith((message) => updates(message as UploadDocumentRequest)) as UploadDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadDocumentRequest create() => UploadDocumentRequest._();
  UploadDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<UploadDocumentRequest> createRepeated() => $pb.PbList<UploadDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadDocumentRequest>(create);
  static UploadDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get file => $_getN(0);
  @$pb.TagNumber(1)
  set file($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get personId => $_getI64(1);
  @$pb.TagNumber(2)
  set personId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get mailId => $_getI64(2);
  @$pb.TagNumber(3)
  set mailId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMailId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMailId() => clearField(3);
}

class UploadDocumentResponse extends $pb.GeneratedMessage {
  factory UploadDocumentResponse({
    $34.Document? document,
  }) {
    final $result = create();
    if (document != null) {
      $result.document = document;
    }
    return $result;
  }
  UploadDocumentResponse._() : super();
  factory UploadDocumentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadDocumentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadDocumentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$34.Document>(1, _omitFieldNames ? '' : 'document', subBuilder: $34.Document.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadDocumentResponse clone() => UploadDocumentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadDocumentResponse copyWith(void Function(UploadDocumentResponse) updates) => super.copyWith((message) => updates(message as UploadDocumentResponse)) as UploadDocumentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadDocumentResponse create() => UploadDocumentResponse._();
  UploadDocumentResponse createEmptyInstance() => create();
  static $pb.PbList<UploadDocumentResponse> createRepeated() => $pb.PbList<UploadDocumentResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadDocumentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadDocumentResponse>(create);
  static UploadDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $34.Document get document => $_getN(0);
  @$pb.TagNumber(1)
  set document($34.Document v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocument() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocument() => clearField(1);
  @$pb.TagNumber(1)
  $34.Document ensureDocument() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
