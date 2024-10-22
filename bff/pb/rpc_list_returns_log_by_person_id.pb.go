// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.24.4
// source: rpc_list_returns_log_by_person_id.proto

package pb

import (
	_ "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type ListReturnsLogRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PersonId uint64 `protobuf:"varint,1,opt,name=person_id,json=personId,proto3" json:"person_id,omitempty"`
}

func (x *ListReturnsLogRequest) Reset() {
	*x = ListReturnsLogRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_list_returns_log_by_person_id_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListReturnsLogRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListReturnsLogRequest) ProtoMessage() {}

func (x *ListReturnsLogRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_list_returns_log_by_person_id_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListReturnsLogRequest.ProtoReflect.Descriptor instead.
func (*ListReturnsLogRequest) Descriptor() ([]byte, []int) {
	return file_rpc_list_returns_log_by_person_id_proto_rawDescGZIP(), []int{0}
}

func (x *ListReturnsLogRequest) GetPersonId() uint64 {
	if x != nil {
		return x.PersonId
	}
	return 0
}

type ListReturnsLogResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	ReturnsLog []*ReturnsLog `protobuf:"bytes,1,rep,name=returns_log,json=returnsLog,proto3" json:"returns_log,omitempty"`
}

func (x *ListReturnsLogResponse) Reset() {
	*x = ListReturnsLogResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_list_returns_log_by_person_id_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListReturnsLogResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListReturnsLogResponse) ProtoMessage() {}

func (x *ListReturnsLogResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_list_returns_log_by_person_id_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListReturnsLogResponse.ProtoReflect.Descriptor instead.
func (*ListReturnsLogResponse) Descriptor() ([]byte, []int) {
	return file_rpc_list_returns_log_by_person_id_proto_rawDescGZIP(), []int{1}
}

func (x *ListReturnsLogResponse) GetReturnsLog() []*ReturnsLog {
	if x != nil {
		return x.ReturnsLog
	}
	return nil
}

var File_rpc_list_returns_log_by_person_id_proto protoreflect.FileDescriptor

var file_rpc_list_returns_log_by_person_id_proto_rawDesc = []byte{
	0x0a, 0x27, 0x72, 0x70, 0x63, 0x5f, 0x6c, 0x69, 0x73, 0x74, 0x5f, 0x72, 0x65, 0x74, 0x75, 0x72,
	0x6e, 0x73, 0x5f, 0x6c, 0x6f, 0x67, 0x5f, 0x62, 0x79, 0x5f, 0x70, 0x65, 0x72, 0x73, 0x6f, 0x6e,
	0x5f, 0x69, 0x64, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d, 0x6f, 0x70, 0x65, 0x6e, 0x61, 0x70,
	0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f, 0x61, 0x6e, 0x6e, 0x6f,
	0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x11, 0x72,
	0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x5f, 0x6c, 0x6f, 0x67, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x22, 0x88, 0x01, 0x0a, 0x15, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73,
	0x4c, 0x6f, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1b, 0x0a, 0x09, 0x70, 0x65,
	0x72, 0x73, 0x6f, 0x6e, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x04, 0x52, 0x08, 0x70,
	0x65, 0x72, 0x73, 0x6f, 0x6e, 0x49, 0x64, 0x3a, 0x52, 0x92, 0x41, 0x4f, 0x0a, 0x3a, 0x2a, 0x0e,
	0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x4c, 0x6f, 0x67, 0x32, 0x1c,
	0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x20, 0x61, 0x20, 0x4c, 0x69, 0x73, 0x74, 0x20, 0x6f,
	0x66, 0x20, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x4c, 0x6f, 0x67, 0xd2, 0x01, 0x09, 0x70,
	0x65, 0x72, 0x73, 0x6f, 0x6e, 0x5f, 0x69, 0x64, 0x32, 0x11, 0x7b, 0x22, 0x70, 0x65, 0x72, 0x73,
	0x6f, 0x6e, 0x5f, 0x69, 0x64, 0x22, 0x3a, 0x20, 0x31, 0x20, 0x7d, 0x22, 0x86, 0x01, 0x0a, 0x16,
	0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x4c, 0x6f, 0x67, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x34, 0x0a, 0x0b, 0x72, 0x65, 0x74, 0x75, 0x72, 0x6e,
	0x73, 0x5f, 0x6c, 0x6f, 0x67, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x0e, 0x2e, 0x70, 0x62,
	0x2e, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x4c, 0x6f, 0x67, 0x42, 0x03, 0x92, 0x41, 0x00,
	0x52, 0x0a, 0x72, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73, 0x4c, 0x6f, 0x67, 0x3a, 0x36, 0x92, 0x41,
	0x33, 0x0a, 0x31, 0x2a, 0x17, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73,
	0x4c, 0x6f, 0x67, 0x20, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x32, 0x16, 0x52, 0x65,
	0x74, 0x75, 0x72, 0x6e, 0x73, 0x20, 0x74, 0x68, 0x65, 0x20, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e,
	0x73, 0x4c, 0x6f, 0x67, 0x42, 0x19, 0x5a, 0x17, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63,
	0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62, 0x2f, 0x64, 0x66, 0x2f, 0x70, 0x62, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_list_returns_log_by_person_id_proto_rawDescOnce sync.Once
	file_rpc_list_returns_log_by_person_id_proto_rawDescData = file_rpc_list_returns_log_by_person_id_proto_rawDesc
)

func file_rpc_list_returns_log_by_person_id_proto_rawDescGZIP() []byte {
	file_rpc_list_returns_log_by_person_id_proto_rawDescOnce.Do(func() {
		file_rpc_list_returns_log_by_person_id_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_list_returns_log_by_person_id_proto_rawDescData)
	})
	return file_rpc_list_returns_log_by_person_id_proto_rawDescData
}

var file_rpc_list_returns_log_by_person_id_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_rpc_list_returns_log_by_person_id_proto_goTypes = []interface{}{
	(*ListReturnsLogRequest)(nil),  // 0: pb.ListReturnsLogRequest
	(*ListReturnsLogResponse)(nil), // 1: pb.ListReturnsLogResponse
	(*ReturnsLog)(nil),             // 2: pb.ReturnsLog
}
var file_rpc_list_returns_log_by_person_id_proto_depIdxs = []int32{
	2, // 0: pb.ListReturnsLogResponse.returns_log:type_name -> pb.ReturnsLog
	1, // [1:1] is the sub-list for method output_type
	1, // [1:1] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_rpc_list_returns_log_by_person_id_proto_init() }
func file_rpc_list_returns_log_by_person_id_proto_init() {
	if File_rpc_list_returns_log_by_person_id_proto != nil {
		return
	}
	file_returns_log_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_rpc_list_returns_log_by_person_id_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListReturnsLogRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_rpc_list_returns_log_by_person_id_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListReturnsLogResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_rpc_list_returns_log_by_person_id_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_list_returns_log_by_person_id_proto_goTypes,
		DependencyIndexes: file_rpc_list_returns_log_by_person_id_proto_depIdxs,
		MessageInfos:      file_rpc_list_returns_log_by_person_id_proto_msgTypes,
	}.Build()
	File_rpc_list_returns_log_by_person_id_proto = out.File
	file_rpc_list_returns_log_by_person_id_proto_rawDesc = nil
	file_rpc_list_returns_log_by_person_id_proto_goTypes = nil
	file_rpc_list_returns_log_by_person_id_proto_depIdxs = nil
}
