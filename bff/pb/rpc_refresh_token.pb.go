// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v3.19.6
// source: rpc_refresh_token.proto

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

type RefreshTokenRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	RefreshToken string `protobuf:"bytes,1,opt,name=refresh_token,json=refreshToken,proto3" json:"refresh_token,omitempty"`
}

func (x *RefreshTokenRequest) Reset() {
	*x = RefreshTokenRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_refresh_token_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RefreshTokenRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RefreshTokenRequest) ProtoMessage() {}

func (x *RefreshTokenRequest) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_refresh_token_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RefreshTokenRequest.ProtoReflect.Descriptor instead.
func (*RefreshTokenRequest) Descriptor() ([]byte, []int) {
	return file_rpc_refresh_token_proto_rawDescGZIP(), []int{0}
}

func (x *RefreshTokenRequest) GetRefreshToken() string {
	if x != nil {
		return x.RefreshToken
	}
	return ""
}

type RefreshTokenResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	AccessToken          string                 `protobuf:"bytes,1,opt,name=access_token,json=accessToken,proto3" json:"access_token,omitempty"`
	AccessTokenExpiresAt *timestamppb.Timestamp `protobuf:"bytes,2,opt,name=access_token_expires_at,json=accessTokenExpiresAt,proto3" json:"access_token_expires_at,omitempty"`
}

func (x *RefreshTokenResponse) Reset() {
	*x = RefreshTokenResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_rpc_refresh_token_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RefreshTokenResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RefreshTokenResponse) ProtoMessage() {}

func (x *RefreshTokenResponse) ProtoReflect() protoreflect.Message {
	mi := &file_rpc_refresh_token_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RefreshTokenResponse.ProtoReflect.Descriptor instead.
func (*RefreshTokenResponse) Descriptor() ([]byte, []int) {
	return file_rpc_refresh_token_proto_rawDescGZIP(), []int{1}
}

func (x *RefreshTokenResponse) GetAccessToken() string {
	if x != nil {
		return x.AccessToken
	}
	return ""
}

func (x *RefreshTokenResponse) GetAccessTokenExpiresAt() *timestamppb.Timestamp {
	if x != nil {
		return x.AccessTokenExpiresAt
	}
	return nil
}

var File_rpc_refresh_token_proto protoreflect.FileDescriptor

var file_rpc_refresh_token_proto_rawDesc = []byte{
	0x0a, 0x17, 0x72, 0x70, 0x63, 0x5f, 0x72, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x5f, 0x74, 0x6f,
	0x6b, 0x65, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x1f, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74,
	0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x2e,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d, 0x6f, 0x70, 0x65, 0x6e, 0x61,
	0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f, 0x61, 0x6e, 0x6e,
	0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xce,
	0x06, 0x0a, 0x13, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0xfa, 0x02, 0x0a, 0x0d, 0x72, 0x65, 0x66, 0x72, 0x65,
	0x73, 0x68, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0xd4,
	0x02, 0x92, 0x41, 0xd0, 0x02, 0x2a, 0x0d, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x20, 0x54,
	0x6f, 0x6b, 0x65, 0x6e, 0x4a, 0xbe, 0x02, 0x22, 0x76, 0x34, 0x2e, 0x70, 0x75, 0x62, 0x6c, 0x69,
	0x63, 0x2e, 0x65, 0x79, 0x4a, 0x6c, 0x62, 0x57, 0x46, 0x70, 0x62, 0x43, 0x49, 0x36, 0x49, 0x6d,
	0x45, 0x79, 0x51, 0x47, 0x49, 0x75, 0x5a, 0x47, 0x55, 0x69, 0x4c, 0x43, 0x4a, 0x6c, 0x65, 0x48,
	0x41, 0x69, 0x4f, 0x69, 0x49, 0x79, 0x4d, 0x44, 0x49, 0x7a, 0x4c, 0x54, 0x45, 0x77, 0x4c, 0x54,
	0x41, 0x32, 0x56, 0x44, 0x41, 0x78, 0x4f, 0x6a, 0x41, 0x79, 0x4f, 0x6a, 0x41, 0x35, 0x4b, 0x7a,
	0x41, 0x79, 0x4f, 0x6a, 0x41, 0x77, 0x49, 0x69, 0x77, 0x69, 0x61, 0x57, 0x46, 0x30, 0x49, 0x6a,
	0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79, 0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56,
	0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a,
	0x6f, 0x77, 0x4d, 0x43, 0x49, 0x73, 0x49, 0x6d, 0x6c, 0x6b, 0x49, 0x6a, 0x6f, 0x69, 0x4e, 0x57,
	0x55, 0x78, 0x5a, 0x44, 0x59, 0x33, 0x5a, 0x47, 0x45, 0x74, 0x4e, 0x32, 0x4d, 0x35, 0x59, 0x69,
	0x30, 0x30, 0x4d, 0x7a, 0x59, 0x31, 0x4c, 0x57, 0x45, 0x30, 0x5a, 0x44, 0x55, 0x74, 0x4d, 0x32,
	0x4e, 0x6a, 0x4d, 0x47, 0x45, 0x77, 0x4e, 0x54, 0x45, 0x79, 0x4e, 0x44, 0x46, 0x6c, 0x49, 0x69,
	0x77, 0x69, 0x62, 0x6d, 0x4a, 0x6d, 0x49, 0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79,
	0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a,
	0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x4a, 0x39, 0x42, 0x6f,
	0x58, 0x33, 0x36, 0x77, 0x30, 0x70, 0x6f, 0x31, 0x76, 0x76, 0x48, 0x53, 0x6a, 0x73, 0x42, 0x50,
	0x5f, 0x4b, 0x57, 0x65, 0x46, 0x78, 0x56, 0x31, 0x78, 0x52, 0x62, 0x51, 0x61, 0x79, 0x71, 0x62,
	0x4a, 0x75, 0x49, 0x6f, 0x4b, 0x32, 0x6a, 0x4b, 0x71, 0x79, 0x31, 0x42, 0x74, 0x32, 0x52, 0x6f,
	0x48, 0x79, 0x4a, 0x62, 0x4c, 0x6f, 0x43, 0x45, 0x4f, 0x31, 0x35, 0x43, 0x52, 0x54, 0x35, 0x44,
	0x6e, 0x51, 0x36, 0x50, 0x30, 0x41, 0x48, 0x6c, 0x42, 0x7a, 0x6a, 0x73, 0x58, 0x74, 0x36, 0x31,
	0x61, 0x44, 0x44, 0x77, 0x22, 0x52, 0x0c, 0x72, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f,
	0x6b, 0x65, 0x6e, 0x3a, 0xb9, 0x03, 0x92, 0x41, 0xb5, 0x03, 0x0a, 0x5f, 0x2a, 0x15, 0x52, 0x65,
	0x66, 0x72, 0x65, 0x73, 0x68, 0x20, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x20, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x32, 0x36, 0x47, 0x65, 0x74, 0x20, 0x61, 0x20, 0x6e, 0x65, 0x77, 0x20, 0x41,
	0x63, 0x63, 0x65, 0x73, 0x73, 0x20, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x20, 0x62, 0x79, 0x20, 0x73,
	0x75, 0x62, 0x6d, 0x69, 0x74, 0x74, 0x69, 0x6e, 0x67, 0x20, 0x74, 0x68, 0x65, 0x20, 0x52, 0x65,
	0x66, 0x72, 0x65, 0x73, 0x68, 0x20, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0xd2, 0x01, 0x0d, 0x72, 0x65,
	0x66, 0x72, 0x65, 0x73, 0x68, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x32, 0xd1, 0x02, 0x7b, 0x22,
	0x72, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x3a, 0x20,
	0x22, 0x76, 0x34, 0x2e, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x2e, 0x65, 0x79, 0x4a, 0x6c, 0x62,
	0x57, 0x46, 0x70, 0x62, 0x43, 0x49, 0x36, 0x49, 0x6d, 0x45, 0x79, 0x51, 0x47, 0x49, 0x75, 0x5a,
	0x47, 0x55, 0x69, 0x4c, 0x43, 0x4a, 0x6c, 0x65, 0x48, 0x41, 0x69, 0x4f, 0x69, 0x49, 0x79, 0x4d,
	0x44, 0x49, 0x7a, 0x4c, 0x54, 0x45, 0x77, 0x4c, 0x54, 0x41, 0x32, 0x56, 0x44, 0x41, 0x78, 0x4f,
	0x6a, 0x41, 0x79, 0x4f, 0x6a, 0x41, 0x35, 0x4b, 0x7a, 0x41, 0x79, 0x4f, 0x6a, 0x41, 0x77, 0x49,
	0x69, 0x77, 0x69, 0x61, 0x57, 0x46, 0x30, 0x49, 0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d,
	0x79, 0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d,
	0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x49, 0x73, 0x49,
	0x6d, 0x6c, 0x6b, 0x49, 0x6a, 0x6f, 0x69, 0x4e, 0x57, 0x55, 0x78, 0x5a, 0x44, 0x59, 0x33, 0x5a,
	0x47, 0x45, 0x74, 0x4e, 0x32, 0x4d, 0x35, 0x59, 0x69, 0x30, 0x30, 0x4d, 0x7a, 0x59, 0x31, 0x4c,
	0x57, 0x45, 0x30, 0x5a, 0x44, 0x55, 0x74, 0x4d, 0x32, 0x4e, 0x6a, 0x4d, 0x47, 0x45, 0x77, 0x4e,
	0x54, 0x45, 0x79, 0x4e, 0x44, 0x46, 0x6c, 0x49, 0x69, 0x77, 0x69, 0x62, 0x6d, 0x4a, 0x6d, 0x49,
	0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79, 0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e,
	0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d,
	0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x4a, 0x39, 0x42, 0x6f, 0x58, 0x33, 0x36, 0x77, 0x30, 0x70, 0x6f,
	0x31, 0x76, 0x76, 0x48, 0x53, 0x6a, 0x73, 0x42, 0x50, 0x5f, 0x4b, 0x57, 0x65, 0x46, 0x78, 0x56,
	0x31, 0x78, 0x52, 0x62, 0x51, 0x61, 0x79, 0x71, 0x62, 0x4a, 0x75, 0x49, 0x6f, 0x4b, 0x32, 0x6a,
	0x4b, 0x71, 0x79, 0x31, 0x42, 0x74, 0x32, 0x52, 0x6f, 0x48, 0x79, 0x4a, 0x62, 0x4c, 0x6f, 0x43,
	0x45, 0x4f, 0x31, 0x35, 0x43, 0x52, 0x54, 0x35, 0x44, 0x6e, 0x51, 0x36, 0x50, 0x30, 0x41, 0x48,
	0x6c, 0x42, 0x7a, 0x6a, 0x73, 0x58, 0x74, 0x36, 0x31, 0x61, 0x44, 0x44, 0x77, 0x22, 0x7d, 0x22,
	0xd7, 0x06, 0x0a, 0x14, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0xf7, 0x02, 0x0a, 0x0c, 0x61, 0x63, 0x63,
	0x65, 0x73, 0x73, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42,
	0xd3, 0x02, 0x92, 0x41, 0xcf, 0x02, 0x2a, 0x0c, 0x41, 0x63, 0x63, 0x65, 0x73, 0x73, 0x20, 0x54,
	0x6f, 0x6b, 0x65, 0x6e, 0x4a, 0xbe, 0x02, 0x22, 0x76, 0x34, 0x2e, 0x70, 0x75, 0x62, 0x6c, 0x69,
	0x63, 0x2e, 0x65, 0x79, 0x4a, 0x6c, 0x62, 0x57, 0x46, 0x70, 0x62, 0x43, 0x49, 0x36, 0x49, 0x6d,
	0x45, 0x79, 0x51, 0x47, 0x49, 0x75, 0x5a, 0x47, 0x55, 0x69, 0x4c, 0x43, 0x4a, 0x6c, 0x65, 0x48,
	0x41, 0x69, 0x4f, 0x69, 0x49, 0x79, 0x4d, 0x44, 0x49, 0x7a, 0x4c, 0x54, 0x45, 0x77, 0x4c, 0x54,
	0x41, 0x31, 0x56, 0x44, 0x41, 0x78, 0x4f, 0x6a, 0x45, 0x33, 0x4f, 0x6a, 0x41, 0x35, 0x4b, 0x7a,
	0x41, 0x79, 0x4f, 0x6a, 0x41, 0x77, 0x49, 0x69, 0x77, 0x69, 0x61, 0x57, 0x46, 0x30, 0x49, 0x6a,
	0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79, 0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56,
	0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a,
	0x6f, 0x77, 0x4d, 0x43, 0x49, 0x73, 0x49, 0x6d, 0x6c, 0x6b, 0x49, 0x6a, 0x6f, 0x69, 0x5a, 0x6a,
	0x6c, 0x68, 0x4d, 0x6a, 0x45, 0x32, 0x4f, 0x57, 0x51, 0x74, 0x4d, 0x57, 0x59, 0x78, 0x59, 0x53,
	0x30, 0x30, 0x59, 0x54, 0x68, 0x69, 0x4c, 0x54, 0x67, 0x7a, 0x5a, 0x57, 0x45, 0x74, 0x4e, 0x7a,
	0x6b, 0x78, 0x4d, 0x7a, 0x59, 0x35, 0x59, 0x6a, 0x59, 0x33, 0x5a, 0x6d, 0x59, 0x78, 0x49, 0x69,
	0x77, 0x69, 0x62, 0x6d, 0x4a, 0x6d, 0x49, 0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79,
	0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a,
	0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x4a, 0x39, 0x41, 0x68,
	0x30, 0x62, 0x56, 0x62, 0x78, 0x39, 0x53, 0x31, 0x4c, 0x52, 0x2d, 0x70, 0x66, 0x38, 0x68, 0x4c,
	0x57, 0x56, 0x52, 0x51, 0x50, 0x55, 0x66, 0x4b, 0x39, 0x7a, 0x72, 0x48, 0x5a, 0x76, 0x41, 0x37,
	0x41, 0x70, 0x4a, 0x35, 0x61, 0x5a, 0x58, 0x77, 0x68, 0x41, 0x37, 0x48, 0x31, 0x6a, 0x2d, 0x6b,
	0x48, 0x68, 0x63, 0x63, 0x42, 0x6a, 0x4f, 0x41, 0x47, 0x59, 0x58, 0x5a, 0x51, 0x54, 0x2d, 0x74,
	0x73, 0x37, 0x4a, 0x71, 0x33, 0x53, 0x4a, 0x6c, 0x7a, 0x6f, 0x35, 0x76, 0x74, 0x55, 0x6a, 0x47,
	0x42, 0x74, 0x44, 0x67, 0x22, 0x52, 0x0b, 0x61, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f, 0x6b,
	0x65, 0x6e, 0x12, 0x51, 0x0a, 0x17, 0x61, 0x63, 0x63, 0x65, 0x73, 0x73, 0x5f, 0x74, 0x6f, 0x6b,
	0x65, 0x6e, 0x5f, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x73, 0x5f, 0x61, 0x74, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52,
	0x14, 0x61, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x45, 0x78, 0x70, 0x69,
	0x72, 0x65, 0x73, 0x41, 0x74, 0x3a, 0xf1, 0x02, 0x92, 0x41, 0xed, 0x02, 0x0a, 0x18, 0x2a, 0x16,
	0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x20, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x20, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x32, 0xd0, 0x02, 0x7b, 0x22, 0x61, 0x63, 0x63, 0x65, 0x73,
	0x73, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x3a, 0x20, 0x22, 0x76, 0x34, 0x2e, 0x70, 0x75,
	0x62, 0x6c, 0x69, 0x63, 0x2e, 0x65, 0x79, 0x4a, 0x6c, 0x62, 0x57, 0x46, 0x70, 0x62, 0x43, 0x49,
	0x36, 0x49, 0x6d, 0x45, 0x79, 0x51, 0x47, 0x49, 0x75, 0x5a, 0x47, 0x55, 0x69, 0x4c, 0x43, 0x4a,
	0x6c, 0x65, 0x48, 0x41, 0x69, 0x4f, 0x69, 0x49, 0x79, 0x4d, 0x44, 0x49, 0x7a, 0x4c, 0x54, 0x45,
	0x77, 0x4c, 0x54, 0x41, 0x31, 0x56, 0x44, 0x41, 0x78, 0x4f, 0x6a, 0x45, 0x33, 0x4f, 0x6a, 0x41,
	0x35, 0x4b, 0x7a, 0x41, 0x79, 0x4f, 0x6a, 0x41, 0x77, 0x49, 0x69, 0x77, 0x69, 0x61, 0x57, 0x46,
	0x30, 0x49, 0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41, 0x79, 0x4d, 0x79, 0x30, 0x78, 0x4d, 0x43, 0x30,
	0x77, 0x4e, 0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73,
	0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x49, 0x73, 0x49, 0x6d, 0x6c, 0x6b, 0x49, 0x6a, 0x6f,
	0x69, 0x5a, 0x6a, 0x6c, 0x68, 0x4d, 0x6a, 0x45, 0x32, 0x4f, 0x57, 0x51, 0x74, 0x4d, 0x57, 0x59,
	0x78, 0x59, 0x53, 0x30, 0x30, 0x59, 0x54, 0x68, 0x69, 0x4c, 0x54, 0x67, 0x7a, 0x5a, 0x57, 0x45,
	0x74, 0x4e, 0x7a, 0x6b, 0x78, 0x4d, 0x7a, 0x59, 0x35, 0x59, 0x6a, 0x59, 0x33, 0x5a, 0x6d, 0x59,
	0x78, 0x49, 0x69, 0x77, 0x69, 0x62, 0x6d, 0x4a, 0x6d, 0x49, 0x6a, 0x6f, 0x69, 0x4d, 0x6a, 0x41,
	0x79, 0x4d, 0x79, 0x30, 0x78, 0x4d, 0x43, 0x30, 0x77, 0x4e, 0x56, 0x51, 0x77, 0x4d, 0x54, 0x6f,
	0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4f, 0x53, 0x73, 0x77, 0x4d, 0x6a, 0x6f, 0x77, 0x4d, 0x43, 0x4a,
	0x39, 0x41, 0x68, 0x30, 0x62, 0x56, 0x62, 0x78, 0x39, 0x53, 0x31, 0x4c, 0x52, 0x2d, 0x70, 0x66,
	0x38, 0x68, 0x4c, 0x57, 0x56, 0x52, 0x51, 0x50, 0x55, 0x66, 0x4b, 0x39, 0x7a, 0x72, 0x48, 0x5a,
	0x76, 0x41, 0x37, 0x41, 0x70, 0x4a, 0x35, 0x61, 0x5a, 0x58, 0x77, 0x68, 0x41, 0x37, 0x48, 0x31,
	0x6a, 0x2d, 0x6b, 0x48, 0x68, 0x63, 0x63, 0x42, 0x6a, 0x4f, 0x41, 0x47, 0x59, 0x58, 0x5a, 0x51,
	0x54, 0x2d, 0x74, 0x73, 0x37, 0x4a, 0x71, 0x33, 0x53, 0x4a, 0x6c, 0x7a, 0x6f, 0x35, 0x76, 0x74,
	0x55, 0x6a, 0x47, 0x42, 0x74, 0x44, 0x67, 0x22, 0x7d, 0x42, 0x19, 0x5a, 0x17, 0x67, 0x69, 0x74,
	0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62, 0x2f, 0x64,
	0x66, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_rpc_refresh_token_proto_rawDescOnce sync.Once
	file_rpc_refresh_token_proto_rawDescData = file_rpc_refresh_token_proto_rawDesc
)

func file_rpc_refresh_token_proto_rawDescGZIP() []byte {
	file_rpc_refresh_token_proto_rawDescOnce.Do(func() {
		file_rpc_refresh_token_proto_rawDescData = protoimpl.X.CompressGZIP(file_rpc_refresh_token_proto_rawDescData)
	})
	return file_rpc_refresh_token_proto_rawDescData
}

var file_rpc_refresh_token_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_rpc_refresh_token_proto_goTypes = []interface{}{
	(*RefreshTokenRequest)(nil),   // 0: pb.RefreshTokenRequest
	(*RefreshTokenResponse)(nil),  // 1: pb.RefreshTokenResponse
	(*timestamppb.Timestamp)(nil), // 2: google.protobuf.Timestamp
}
var file_rpc_refresh_token_proto_depIdxs = []int32{
	2, // 0: pb.RefreshTokenResponse.access_token_expires_at:type_name -> google.protobuf.Timestamp
	1, // [1:1] is the sub-list for method output_type
	1, // [1:1] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_rpc_refresh_token_proto_init() }
func file_rpc_refresh_token_proto_init() {
	if File_rpc_refresh_token_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_rpc_refresh_token_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RefreshTokenRequest); i {
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
		file_rpc_refresh_token_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RefreshTokenResponse); i {
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
			RawDescriptor: file_rpc_refresh_token_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_rpc_refresh_token_proto_goTypes,
		DependencyIndexes: file_rpc_refresh_token_proto_depIdxs,
		MessageInfos:      file_rpc_refresh_token_proto_msgTypes,
	}.Build()
	File_rpc_refresh_token_proto = out.File
	file_rpc_refresh_token_proto_rawDesc = nil
	file_rpc_refresh_token_proto_goTypes = nil
	file_rpc_refresh_token_proto_depIdxs = nil
}