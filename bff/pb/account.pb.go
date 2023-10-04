// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v3.19.6
// source: account.proto

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

type Account struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id                  int64                  `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	Email               string                 `protobuf:"bytes,2,opt,name=email,proto3" json:"email,omitempty"`
	Firstname           string                 `protobuf:"bytes,3,opt,name=firstname,proto3" json:"firstname,omitempty"`
	Lastname            string                 `protobuf:"bytes,4,opt,name=lastname,proto3" json:"lastname,omitempty"`
	Street              string                 `protobuf:"bytes,5,opt,name=street,proto3" json:"street,omitempty"`
	City                string                 `protobuf:"bytes,6,opt,name=city,proto3" json:"city,omitempty"`
	Zip                 string                 `protobuf:"bytes,7,opt,name=zip,proto3" json:"zip,omitempty"`
	Country             string                 `protobuf:"bytes,8,opt,name=country,proto3" json:"country,omitempty"`
	Birthday            *timestamppb.Timestamp `protobuf:"bytes,9,opt,name=birthday,proto3" json:"birthday,omitempty"`
	Phone               string                 `protobuf:"bytes,10,opt,name=phone,proto3" json:"phone,omitempty"`
	PrivacyAccepted     bool                   `protobuf:"varint,11,opt,name=privacy_accepted,json=privacyAccepted,proto3" json:"privacy_accepted,omitempty"`
	PrivacyAcceptedDate *timestamppb.Timestamp `protobuf:"bytes,12,opt,name=privacy_accepted_date,json=privacyAcceptedDate,proto3" json:"privacy_accepted_date,omitempty"`
	PermissionLevel     int32                  `protobuf:"varint,13,opt,name=permission_level,json=permissionLevel,proto3" json:"permission_level,omitempty"`
	Creator             string                 `protobuf:"bytes,14,opt,name=creator,proto3" json:"creator,omitempty"`
	Created             *timestamppb.Timestamp `protobuf:"bytes,15,opt,name=created,proto3" json:"created,omitempty"`
	Changer             string                 `protobuf:"bytes,16,opt,name=changer,proto3" json:"changer,omitempty"`
	Changed             *timestamppb.Timestamp `protobuf:"bytes,17,opt,name=changed,proto3" json:"changed,omitempty"`
}

func (x *Account) Reset() {
	*x = Account{}
	if protoimpl.UnsafeEnabled {
		mi := &file_account_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Account) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Account) ProtoMessage() {}

func (x *Account) ProtoReflect() protoreflect.Message {
	mi := &file_account_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Account.ProtoReflect.Descriptor instead.
func (*Account) Descriptor() ([]byte, []int) {
	return file_account_proto_rawDescGZIP(), []int{0}
}

func (x *Account) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *Account) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *Account) GetFirstname() string {
	if x != nil {
		return x.Firstname
	}
	return ""
}

func (x *Account) GetLastname() string {
	if x != nil {
		return x.Lastname
	}
	return ""
}

func (x *Account) GetStreet() string {
	if x != nil {
		return x.Street
	}
	return ""
}

func (x *Account) GetCity() string {
	if x != nil {
		return x.City
	}
	return ""
}

func (x *Account) GetZip() string {
	if x != nil {
		return x.Zip
	}
	return ""
}

func (x *Account) GetCountry() string {
	if x != nil {
		return x.Country
	}
	return ""
}

func (x *Account) GetBirthday() *timestamppb.Timestamp {
	if x != nil {
		return x.Birthday
	}
	return nil
}

func (x *Account) GetPhone() string {
	if x != nil {
		return x.Phone
	}
	return ""
}

func (x *Account) GetPrivacyAccepted() bool {
	if x != nil {
		return x.PrivacyAccepted
	}
	return false
}

func (x *Account) GetPrivacyAcceptedDate() *timestamppb.Timestamp {
	if x != nil {
		return x.PrivacyAcceptedDate
	}
	return nil
}

func (x *Account) GetPermissionLevel() int32 {
	if x != nil {
		return x.PermissionLevel
	}
	return 0
}

func (x *Account) GetCreator() string {
	if x != nil {
		return x.Creator
	}
	return ""
}

func (x *Account) GetCreated() *timestamppb.Timestamp {
	if x != nil {
		return x.Created
	}
	return nil
}

func (x *Account) GetChanger() string {
	if x != nil {
		return x.Changer
	}
	return ""
}

func (x *Account) GetChanged() *timestamppb.Timestamp {
	if x != nil {
		return x.Changed
	}
	return nil
}

var File_account_proto protoreflect.FileDescriptor

var file_account_proto_rawDesc = []byte{
	0x0a, 0x0d, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12,
	0x02, 0x70, 0x62, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e,
	0x2d, 0x6f, 0x70, 0x65, 0x6e, 0x61, 0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f,
	0x6e, 0x73, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x22, 0x94, 0x08, 0x0a, 0x07, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74,
	0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64,
	0x12, 0x14, 0x0a, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x12, 0x1c, 0x0a, 0x09, 0x66, 0x69, 0x72, 0x73, 0x74, 0x6e,
	0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x66, 0x69, 0x72, 0x73, 0x74,
	0x6e, 0x61, 0x6d, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x6c, 0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65,
	0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x6c, 0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65,
	0x12, 0x16, 0x0a, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x63, 0x69, 0x74, 0x79,
	0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x63, 0x69, 0x74, 0x79, 0x12, 0x10, 0x0a, 0x03,
	0x7a, 0x69, 0x70, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x7a, 0x69, 0x70, 0x12, 0x18,
	0x0a, 0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x12, 0x36, 0x0a, 0x08, 0x62, 0x69, 0x72, 0x74,
	0x68, 0x64, 0x61, 0x79, 0x18, 0x09, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d,
	0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x08, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61, 0x79,
	0x12, 0x14, 0x0a, 0x05, 0x70, 0x68, 0x6f, 0x6e, 0x65, 0x18, 0x0a, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x05, 0x70, 0x68, 0x6f, 0x6e, 0x65, 0x12, 0x29, 0x0a, 0x10, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63,
	0x79, 0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x08,
	0x52, 0x0f, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79, 0x41, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65,
	0x64, 0x12, 0x4e, 0x0a, 0x15, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79, 0x5f, 0x61, 0x63, 0x63,
	0x65, 0x70, 0x74, 0x65, 0x64, 0x5f, 0x64, 0x61, 0x74, 0x65, 0x18, 0x0c, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x13, 0x70, 0x72,
	0x69, 0x76, 0x61, 0x63, 0x79, 0x41, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x44, 0x61, 0x74,
	0x65, 0x12, 0x29, 0x0a, 0x10, 0x70, 0x65, 0x72, 0x6d, 0x69, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x5f,
	0x6c, 0x65, 0x76, 0x65, 0x6c, 0x18, 0x0d, 0x20, 0x01, 0x28, 0x05, 0x52, 0x0f, 0x70, 0x65, 0x72,
	0x6d, 0x69, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x4c, 0x65, 0x76, 0x65, 0x6c, 0x12, 0x18, 0x0a, 0x07,
	0x63, 0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x18, 0x0e, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63,
	0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x12, 0x34, 0x0a, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65,
	0x64, 0x18, 0x0f, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x52, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x12, 0x18, 0x0a, 0x07,
	0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x18, 0x10, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63,
	0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x12, 0x34, 0x0a, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65,
	0x64, 0x18, 0x11, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x52, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x3a, 0xbc, 0x03, 0x92,
	0x41, 0xb8, 0x03, 0x0a, 0x09, 0x2a, 0x07, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x32, 0xaa,
	0x03, 0x7b, 0x22, 0x69, 0x64, 0x22, 0x3a, 0x20, 0x31, 0x38, 0x35, 0x2c, 0x22, 0x65, 0x6d, 0x61,
	0x69, 0x6c, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65,
	0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x66, 0x69,
	0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x4a, 0x6f, 0x68, 0x6e, 0x22,
	0x2c, 0x20, 0x22, 0x6c, 0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x44,
	0x6f, 0x65, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x68, 0x6f, 0x6e, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x22,
	0x2c, 0x20, 0x22, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x22, 0x3a, 0x20, 0x22, 0x44, 0x65, 0x61,
	0x74, 0x68, 0x20, 0x53, 0x74, 0x61, 0x72, 0x20, 0x32, 0x22, 0x2c, 0x20, 0x22, 0x7a, 0x69, 0x70,
	0x22, 0x3a, 0x20, 0x22, 0x30, 0x38, 0x31, 0x35, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x69, 0x74, 0x79,
	0x22, 0x3a, 0x20, 0x22, 0x4e, 0x65, 0x77, 0x20, 0x59, 0x6f, 0x72, 0x6b, 0x22, 0x2c, 0x20, 0x22,
	0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x55, 0x53, 0x41, 0x22, 0x2c,
	0x20, 0x22, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x31, 0x39,
	0x39, 0x30, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30,
	0x5a, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79, 0x5f, 0x61, 0x63, 0x63,
	0x65, 0x70, 0x74, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x66, 0x61, 0x6c, 0x73, 0x65, 0x2c, 0x20, 0x22,
	0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79, 0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64,
	0x5f, 0x64, 0x61, 0x74, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x30, 0x30, 0x30, 0x31, 0x2d, 0x30, 0x31,
	0x2d, 0x30, 0x31, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x2c, 0x20,
	0x22, 0x63, 0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e,
	0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d,
	0x22, 0x2c, 0x20, 0x22, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x22, 0x32,
	0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x32, 0x3a, 0x33, 0x30, 0x3a,
	0x35, 0x33, 0x5a, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x22, 0x3a,
	0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70,
	0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65,
	0x64, 0x22, 0x3a, 0x20, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54,
	0x30, 0x32, 0x3a, 0x33, 0x30, 0x3a, 0x35, 0x33, 0x5a, 0x22, 0x7d, 0x42, 0x19, 0x5a, 0x17, 0x67,
	0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62,
	0x2f, 0x64, 0x66, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_account_proto_rawDescOnce sync.Once
	file_account_proto_rawDescData = file_account_proto_rawDesc
)

func file_account_proto_rawDescGZIP() []byte {
	file_account_proto_rawDescOnce.Do(func() {
		file_account_proto_rawDescData = protoimpl.X.CompressGZIP(file_account_proto_rawDescData)
	})
	return file_account_proto_rawDescData
}

var file_account_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_account_proto_goTypes = []interface{}{
	(*Account)(nil),               // 0: pb.Account
	(*timestamppb.Timestamp)(nil), // 1: google.protobuf.Timestamp
}
var file_account_proto_depIdxs = []int32{
	1, // 0: pb.Account.birthday:type_name -> google.protobuf.Timestamp
	1, // 1: pb.Account.privacy_accepted_date:type_name -> google.protobuf.Timestamp
	1, // 2: pb.Account.created:type_name -> google.protobuf.Timestamp
	1, // 3: pb.Account.changed:type_name -> google.protobuf.Timestamp
	4, // [4:4] is the sub-list for method output_type
	4, // [4:4] is the sub-list for method input_type
	4, // [4:4] is the sub-list for extension type_name
	4, // [4:4] is the sub-list for extension extendee
	0, // [0:4] is the sub-list for field type_name
}

func init() { file_account_proto_init() }
func file_account_proto_init() {
	if File_account_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_account_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Account); i {
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
			RawDescriptor: file_account_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_account_proto_goTypes,
		DependencyIndexes: file_account_proto_depIdxs,
		MessageInfos:      file_account_proto_msgTypes,
	}.Build()
	File_account_proto = out.File
	file_account_proto_rawDesc = nil
	file_account_proto_goTypes = nil
	file_account_proto_depIdxs = nil
}
