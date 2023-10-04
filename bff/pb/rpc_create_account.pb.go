// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v3.19.6
// source: rpc_create_account.proto

package pb

import (
	_ "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type CreateAccountRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Email           string                 `protobuf:"bytes,1,opt,name=email,proto3" json:"email,omitempty"`
	Password        string                 `protobuf:"bytes,2,opt,name=password,proto3" json:"password,omitempty"`
	Firstname       string                 `protobuf:"bytes,3,opt,name=firstname,proto3" json:"firstname,omitempty"`
	Lastname        string                 `protobuf:"bytes,4,opt,name=lastname,proto3" json:"lastname,omitempty"`
	Street          string                 `protobuf:"bytes,5,opt,name=street,proto3" json:"street,omitempty"`
	City            string                 `protobuf:"bytes,6,opt,name=city,proto3" json:"city,omitempty"`
	Zip             string                 `protobuf:"bytes,7,opt,name=zip,proto3" json:"zip,omitempty"`
	Country         string                 `protobuf:"bytes,8,opt,name=country,proto3" json:"country,omitempty"`
	Phone           string                 `protobuf:"bytes,9,opt,name=phone,proto3" json:"phone,omitempty"`
	Birthday        *timestamppb.Timestamp `protobuf:"bytes,10,opt,name=birthday,proto3" json:"birthday,omitempty"`
	PrivacyAccepted *bool                  `protobuf:"varint,11,opt,name=privacy_accepted,json=privacyAccepted,proto3,oneof" json:"privacy_accepted,omitempty"`
}

func (x *CreateAccountRequest) Reset() {
	*x = CreateAccountRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_create_account_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateAccountRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateAccountRequest) ProtoMessage() {}

func (x *CreateAccountRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_create_account_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateAccountRequest.ProtoReflect.Descriptor instead.
func (*CreateAccountRequest) Descriptor() ([]byte, []int) {
	return file_rpc_create_account_proto_rawDescGZIP(), []int{0}
}

func (x *CreateAccountRequest) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *CreateAccountRequest) GetPassword() string {
	if x != nil {
		return x.Password
	}
	return ""
}

func (x *CreateAccountRequest) GetFirstname() string {
	if x != nil {
		return x.Firstname
	}
	return ""
}

func (x *CreateAccountRequest) GetLastname() string {
	if x != nil {
		return x.Lastname
	}
	return ""
}

func (x *CreateAccountRequest) GetStreet() string {
	if x != nil {
		return x.Street
	}
	return ""
}

func (x *CreateAccountRequest) GetCity() string {
	if x != nil {
		return x.City
	}
	return ""
}

func (x *CreateAccountRequest) GetZip() string {
	if x != nil {
		return x.Zip
	}
	return ""
}

func (x *CreateAccountRequest) GetCountry() string {
	if x != nil {
		return x.Country
	}
	return ""
}

func (x *CreateAccountRequest) GetPhone() string {
	if x != nil {
		return x.Phone
	}
	return ""
}

func (x *CreateAccountRequest) GetBirthday() *timestamppb.Timestamp {
	if x != nil {
		return x.Birthday
	}
	return nil
}

func (x *CreateAccountRequest) GetPrivacyAccepted() bool {
	if x != nil && x.PrivacyAccepted != nil {
		return *x.PrivacyAccepted
	}
	return false
}

// \"1990-10-05T00:00:0Z\"
type CreateAccountResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Account *Account `protobuf:"bytes,1,opt,name=account,proto3" json:"account,omitempty"`
}

func (x *CreateAccountResponse) Reset() {
	*x = CreateAccountResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_create_account_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateAccountResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateAccountResponse) ProtoMessage() {}

func (x *CreateAccountResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_create_account_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateAccountResponse.ProtoReflect.Descriptor instead.
func (*CreateAccountResponse) Descriptor() ([]byte, []int) {
	return file_rpc_create_account_proto_rawDescGZIP(), []int{1}
}

func (x *CreateAccountResponse) GetAccount() *Account {
	if x != nil {
		return x.Account
	}
	return nil
}

var File_rpc_create_account_proto protoreflect.FileDescriptor

var file_rpc_create_account_proto_rawDesc = []byte{
	0x0a, 0x18, 0x72, 0x70, 0x63, 0x5f, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x5f, 0x61, 0x63, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x1f,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f,
	0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d, 0x6f, 0x70, 0x65, 0x6e,
	0x61, 0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f, 0x61, 0x6e,
	0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a,
	0x0d, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xf9,
	0x05, 0x0a, 0x14, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x14, 0x0a, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x12, 0x1a, 0x0a,
	0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x12, 0x1c, 0x0a, 0x09, 0x66, 0x69, 0x72,
	0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x66, 0x69,
	0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x6c, 0x61, 0x73, 0x74, 0x6e,
	0x61, 0x6d, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x6c, 0x61, 0x73, 0x74, 0x6e,
	0x61, 0x6d, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x18, 0x05, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x63,
	0x69, 0x74, 0x79, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x63, 0x69, 0x74, 0x79, 0x12,
	0x10, 0x0a, 0x03, 0x7a, 0x69, 0x70, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x7a, 0x69,
	0x70, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x18, 0x08, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x12, 0x14, 0x0a, 0x05, 0x70,
	0x68, 0x6f, 0x6e, 0x65, 0x18, 0x09, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x70, 0x68, 0x6f, 0x6e,
	0x65, 0x12, 0x52, 0x0a, 0x08, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61, 0x79, 0x18, 0x0a, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x42,
	0x1a, 0x92, 0x41, 0x17, 0x4a, 0x15, 0x22, 0x31, 0x39, 0x39, 0x30, 0x2d, 0x31, 0x30, 0x2d, 0x30,
	0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x5a, 0x22, 0x52, 0x08, 0x62, 0x69, 0x72,
	0x74, 0x68, 0x64, 0x61, 0x79, 0x12, 0x39, 0x0a, 0x10, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79,
	0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x08, 0x42,
	0x09, 0x92, 0x41, 0x06, 0x4a, 0x04, 0x74, 0x72, 0x75, 0x65, 0x48, 0x00, 0x52, 0x0f, 0x70, 0x72,
	0x69, 0x76, 0x61, 0x63, 0x79, 0x41, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x88, 0x01, 0x01,
	0x3a, 0xe2, 0x02, 0x92, 0x41, 0xde, 0x02, 0x0a, 0x78, 0x2a, 0x0e, 0x43, 0x72, 0x65, 0x61, 0x74,
	0x65, 0x20, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x32, 0x11, 0x43, 0x72, 0x65, 0x61, 0x74,
	0x65, 0x20, 0x61, 0x6e, 0x20, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0xd2, 0x01, 0x05, 0x65,
	0x6d, 0x61, 0x69, 0x6c, 0xd2, 0x01, 0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0xd2,
	0x01, 0x09, 0x66, 0x69, 0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0xd2, 0x01, 0x08, 0x6c, 0x61,
	0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0xd2, 0x01, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0xd2,
	0x01, 0x04, 0x63, 0x69, 0x74, 0x79, 0xd2, 0x01, 0x03, 0x7a, 0x69, 0x70, 0xd2, 0x01, 0x07, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0xd2, 0x01, 0x08, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61,
	0x79, 0x32, 0xe1, 0x01, 0x7b, 0x22, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x22, 0x3a, 0x20, 0x22, 0x6a,
	0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e,
	0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x22,
	0x3a, 0x20, 0x22, 0x4d, 0x61, 0x79, 0x54, 0x68, 0x65, 0x46, 0x6f, 0x72, 0x63, 0x65, 0x42, 0x65,
	0x57, 0x69, 0x74, 0x68, 0x59, 0x6f, 0x75, 0x21, 0x22, 0x2c, 0x20, 0x22, 0x66, 0x69, 0x72, 0x73,
	0x74, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x4a, 0x6f, 0x68, 0x6e, 0x22, 0x2c, 0x20,
	0x22, 0x6c, 0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x44, 0x6f, 0x65,
	0x22, 0x2c, 0x20, 0x22, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x22, 0x3a, 0x20, 0x22, 0x4d, 0x61,
	0x69, 0x6e, 0x20, 0x53, 0x74, 0x72, 0x65, 0x65, 0x74, 0x20, 0x31, 0x22, 0x2c, 0x20, 0x22, 0x7a,
	0x69, 0x70, 0x22, 0x3a, 0x20, 0x22, 0x30, 0x38, 0x31, 0x35, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x69,
	0x74, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x4e, 0x65, 0x77, 0x20, 0x59, 0x6f, 0x72, 0x6b, 0x22, 0x2c,
	0x20, 0x22, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x55, 0x53, 0x41,
	0x22, 0x2c, 0x20, 0x22, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61, 0x79, 0x22, 0x3a, 0x20, 0x22,
	0x31, 0x39, 0x39, 0x30, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30,
	0x3a, 0x30, 0x5a, 0x22, 0x7d, 0x42, 0x13, 0x0a, 0x11, 0x5f, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63,
	0x79, 0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x22, 0x78, 0x0a, 0x15, 0x43, 0x72,
	0x65, 0x61, 0x74, 0x65, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x2a, 0x0a, 0x07, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x0b, 0x2e, 0x70, 0x62, 0x2e, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e,
	0x74, 0x42, 0x03, 0x92, 0x41, 0x00, 0x52, 0x07, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x3a,
	0x33, 0x92, 0x41, 0x30, 0x0a, 0x2e, 0x2a, 0x0f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x20,
	0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x32, 0x1b, 0x52, 0x65, 0x74, 0x75, 0x72, 0x6e, 0x73,
	0x20, 0x74, 0x68, 0x65, 0x20, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x20, 0x41, 0x63, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x42, 0x19, 0x5a, 0x17, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63,
	0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62, 0x2f, 0x64, 0x66, 0x2f, 0x70, 0x62, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_create_account_proto_rawDescOnce sync.Once
	file_rpc_create_account_proto_rawDescData = file_rpc_create_account_proto_rawDesc
)

func file_rpc_create_account_proto_rawDescGZIP() []byte {
	file_rpc_create_account_proto_rawDescOnce.Do(func() {
		file_rpc_create_account_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_create_account_proto_rawDescData)
	})
	return file_rpc_create_account_proto_rawDescData
}

var file_rpc_create_account_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_rpc_create_account_proto_goTypes = []interface{}{
	(*CreateAccountRequest)(nil),  // 0: pb.CreateAccountRequest
	(*CreateAccountResponse)(nil), // 1: pb.CreateAccountResponse
	(*timestamppb.Timestamp)(nil), // 2: google.protobuf.Timestamp
	(*Account)(nil),               // 3: pb.Account
}
var file_rpc_create_account_proto_depIdxs = []int32{
	2, // 0: pb.CreateAccountRequest.birthday:type_name -> google.protobuf.Timestamp
	3, // 1: pb.CreateAccountResponse.account:type_name -> pb.Account
	2, // [2:2] is the sub-list for method output_type
	2, // [2:2] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_rpc_create_account_proto_init() }
func file_rpc_create_account_proto_init() {
	if File_rpc_create_account_proto != nil {
		return
	}
	file_account_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_rpc_create_account_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateAccountRequest); i {
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
		file_rpc_create_account_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateAccountResponse); i {
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
	file_rpc_create_account_proto_msgTypes[0].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_rpc_create_account_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_create_account_proto_goTypes,
		DependencyIndexes: file_rpc_create_account_proto_depIdxs,
		MessageInfos:      file_rpc_create_account_proto_msgTypes,
	}.Build()
	File_rpc_create_account_proto = out.File
	file_rpc_create_account_proto_rawDesc = nil
	file_rpc_create_account_proto_goTypes = nil
	file_rpc_create_account_proto_depIdxs = nil
}
