// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.24.4
// source: person.proto

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

type Person struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id           uint64                 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	AccountId    uint64                 `protobuf:"varint,2,opt,name=account_id,json=accountId,proto3" json:"account_id,omitempty"`
	Firstname    string                 `protobuf:"bytes,3,opt,name=firstname,proto3" json:"firstname,omitempty"`
	Lastname     string                 `protobuf:"bytes,4,opt,name=lastname,proto3" json:"lastname,omitempty"`
	Street       string                 `protobuf:"bytes,5,opt,name=street,proto3" json:"street,omitempty"`
	City         string                 `protobuf:"bytes,6,opt,name=city,proto3" json:"city,omitempty"`
	Zip          string                 `protobuf:"bytes,7,opt,name=zip,proto3" json:"zip,omitempty"`
	Country      string                 `protobuf:"bytes,8,opt,name=country,proto3" json:"country,omitempty"`
	Birthday     *timestamppb.Timestamp `protobuf:"bytes,9,opt,name=birthday,proto3" json:"birthday,omitempty"`
	Creator      string                 `protobuf:"bytes,10,opt,name=creator,proto3" json:"creator,omitempty"`
	Created      *timestamppb.Timestamp `protobuf:"bytes,11,opt,name=created,proto3" json:"created,omitempty"`
	Changer      string                 `protobuf:"bytes,12,opt,name=changer,proto3" json:"changer,omitempty"`
	Changed      *timestamppb.Timestamp `protobuf:"bytes,13,opt,name=changed,proto3" json:"changed,omitempty"`
	Relationship *string                `protobuf:"bytes,14,opt,name=relationship,proto3,oneof" json:"relationship,omitempty"`
}

func (x *Person) Reset() {
	*x = Person{}
	if protoimpl.UnsafeEnabled {
		mi := &file_person_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Person) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Person) ProtoMessage() {}

func (x *Person) ProtoReflect() protoreflect.Message {
	mi := &file_person_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Person.ProtoReflect.Descriptor instead.
func (*Person) Descriptor() ([]byte, []int) {
	return file_person_proto_rawDescGZIP(), []int{0}
}

func (x *Person) GetId() uint64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *Person) GetAccountId() uint64 {
	if x != nil {
		return x.AccountId
	}
	return 0
}

func (x *Person) GetFirstname() string {
	if x != nil {
		return x.Firstname
	}
	return ""
}

func (x *Person) GetLastname() string {
	if x != nil {
		return x.Lastname
	}
	return ""
}

func (x *Person) GetStreet() string {
	if x != nil {
		return x.Street
	}
	return ""
}

func (x *Person) GetCity() string {
	if x != nil {
		return x.City
	}
	return ""
}

func (x *Person) GetZip() string {
	if x != nil {
		return x.Zip
	}
	return ""
}

func (x *Person) GetCountry() string {
	if x != nil {
		return x.Country
	}
	return ""
}

func (x *Person) GetBirthday() *timestamppb.Timestamp {
	if x != nil {
		return x.Birthday
	}
	return nil
}

func (x *Person) GetCreator() string {
	if x != nil {
		return x.Creator
	}
	return ""
}

func (x *Person) GetCreated() *timestamppb.Timestamp {
	if x != nil {
		return x.Created
	}
	return nil
}

func (x *Person) GetChanger() string {
	if x != nil {
		return x.Changer
	}
	return ""
}

func (x *Person) GetChanged() *timestamppb.Timestamp {
	if x != nil {
		return x.Changed
	}
	return nil
}

func (x *Person) GetRelationship() string {
	if x != nil && x.Relationship != nil {
		return *x.Relationship
	}
	return ""
}

var File_person_proto protoreflect.FileDescriptor

var file_person_proto_rawDesc = []byte{
	0x0a, 0x0c, 0x70, 0x65, 0x72, 0x73, 0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02,
	0x70, 0x62, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x1a, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d,
	0x6f, 0x70, 0x65, 0x6e, 0x61, 0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e,
	0x73, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x22, 0xf1, 0x07, 0x0a, 0x06, 0x50, 0x65, 0x72, 0x73, 0x6f, 0x6e, 0x12, 0x0e,
	0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x04, 0x52, 0x02, 0x69, 0x64, 0x12, 0x1d,
	0x0a, 0x0a, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01,
	0x28, 0x04, 0x52, 0x09, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x49, 0x64, 0x12, 0x1c, 0x0a,
	0x09, 0x66, 0x69, 0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x09, 0x66, 0x69, 0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x6c,
	0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x6c,
	0x61, 0x73, 0x74, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65,
	0x74, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x73, 0x74, 0x72, 0x65, 0x65, 0x74, 0x12,
	0x12, 0x0a, 0x04, 0x63, 0x69, 0x74, 0x79, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x63,
	0x69, 0x74, 0x79, 0x12, 0x10, 0x0a, 0x03, 0x7a, 0x69, 0x70, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x03, 0x7a, 0x69, 0x70, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79,
	0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72, 0x79, 0x12,
	0x53, 0x0a, 0x08, 0x62, 0x69, 0x72, 0x74, 0x68, 0x64, 0x61, 0x79, 0x18, 0x09, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x42, 0x1b, 0x92,
	0x41, 0x18, 0x4a, 0x16, 0x22, 0x31, 0x39, 0x39, 0x30, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54,
	0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x52, 0x08, 0x62, 0x69, 0x72, 0x74,
	0x68, 0x64, 0x61, 0x79, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x18,
	0x0a, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x6f, 0x72, 0x12, 0x51,
	0x0a, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x42, 0x1b, 0x92, 0x41, 0x18,
	0x4a, 0x16, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x30,
	0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x52, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65,
	0x64, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x18, 0x0c, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x12, 0x51, 0x0a, 0x07, 0x63,
	0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x18, 0x0d, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54,
	0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x42, 0x1b, 0x92, 0x41, 0x18, 0x4a, 0x16, 0x22,
	0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30,
	0x3a, 0x30, 0x30, 0x5a, 0x22, 0x52, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x12, 0x27,
	0x0a, 0x0c, 0x72, 0x65, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x68, 0x69, 0x70, 0x18, 0x0e,
	0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x0c, 0x72, 0x65, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x73, 0x68, 0x69, 0x70, 0x88, 0x01, 0x01, 0x3a, 0xbc, 0x03, 0x92, 0x41, 0xb8, 0x03, 0x0a, 0x08,
	0x2a, 0x06, 0x50, 0x65, 0x72, 0x73, 0x6f, 0x6e, 0x32, 0xab, 0x03, 0x7b, 0x22, 0x69, 0x64, 0x22,
	0x3a, 0x20, 0x22, 0x31, 0x22, 0x2c, 0x22, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x22, 0x3a, 0x20, 0x22,
	0x6a, 0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65,
	0x2e, 0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x66, 0x69, 0x72, 0x73, 0x74, 0x6e, 0x61, 0x6d,
	0x65, 0x22, 0x3a, 0x20, 0x22, 0x4a, 0x6f, 0x68, 0x6e, 0x22, 0x2c, 0x20, 0x22, 0x6c, 0x61, 0x73,
	0x74, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x44, 0x6f, 0x65, 0x22, 0x2c, 0x20, 0x22,
	0x70, 0x68, 0x6f, 0x6e, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x22, 0x2c, 0x20, 0x22, 0x73, 0x74, 0x72,
	0x65, 0x65, 0x74, 0x22, 0x3a, 0x20, 0x22, 0x44, 0x65, 0x61, 0x74, 0x68, 0x20, 0x53, 0x74, 0x61,
	0x72, 0x20, 0x32, 0x22, 0x2c, 0x20, 0x22, 0x7a, 0x69, 0x70, 0x22, 0x3a, 0x20, 0x22, 0x30, 0x38,
	0x31, 0x35, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x69, 0x74, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x4e, 0x65,
	0x77, 0x20, 0x59, 0x6f, 0x72, 0x6b, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x72,
	0x79, 0x22, 0x3a, 0x20, 0x22, 0x55, 0x53, 0x41, 0x22, 0x2c, 0x20, 0x22, 0x62, 0x69, 0x72, 0x74,
	0x68, 0x64, 0x61, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x31, 0x39, 0x39, 0x30, 0x2d, 0x31, 0x30, 0x2d,
	0x30, 0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x2c, 0x20, 0x22,
	0x70, 0x72, 0x69, 0x76, 0x61, 0x63, 0x79, 0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64,
	0x22, 0x3a, 0x20, 0x66, 0x61, 0x6c, 0x73, 0x65, 0x2c, 0x20, 0x22, 0x70, 0x72, 0x69, 0x76, 0x61,
	0x63, 0x79, 0x5f, 0x61, 0x63, 0x63, 0x65, 0x70, 0x74, 0x65, 0x64, 0x5f, 0x64, 0x61, 0x74, 0x65,
	0x22, 0x3a, 0x20, 0x22, 0x30, 0x30, 0x30, 0x31, 0x2d, 0x30, 0x31, 0x2d, 0x30, 0x31, 0x54, 0x30,
	0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x72, 0x65, 0x61,
	0x74, 0x6f, 0x72, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40,
	0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x63,
	0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31,
	0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x32, 0x3a, 0x33, 0x30, 0x3a, 0x35, 0x33, 0x5a, 0x22, 0x2c,
	0x20, 0x22, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68,
	0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f,
	0x6d, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x22,
	0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x32, 0x3a, 0x33, 0x30,
	0x3a, 0x35, 0x33, 0x5a, 0x22, 0x7d, 0x42, 0x0f, 0x0a, 0x0d, 0x5f, 0x72, 0x65, 0x6c, 0x61, 0x74,
	0x69, 0x6f, 0x6e, 0x73, 0x68, 0x69, 0x70, 0x42, 0x19, 0x5a, 0x17, 0x67, 0x69, 0x74, 0x68, 0x75,
	0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62, 0x2f, 0x64, 0x66, 0x2f,
	0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_person_proto_rawDescOnce sync.Once
	file_person_proto_rawDescData = file_person_proto_rawDesc
)

func file_person_proto_rawDescGZIP() []byte {
	file_person_proto_rawDescOnce.Do(func() {
		file_person_proto_rawDescData = protoimpl.X.CompressGZIP(file_person_proto_rawDescData)
	})
	return file_person_proto_rawDescData
}

var file_person_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_person_proto_goTypes = []interface{}{
	(*Person)(nil),                // 0: pb.Person
	(*timestamppb.Timestamp)(nil), // 1: google.protobuf.Timestamp
}
var file_person_proto_depIdxs = []int32{
	1, // 0: pb.Person.birthday:type_name -> google.protobuf.Timestamp
	1, // 1: pb.Person.created:type_name -> google.protobuf.Timestamp
	1, // 2: pb.Person.changed:type_name -> google.protobuf.Timestamp
	3, // [3:3] is the sub-list for method output_type
	3, // [3:3] is the sub-list for method input_type
	3, // [3:3] is the sub-list for extension type_name
	3, // [3:3] is the sub-list for extension extendee
	0, // [0:3] is the sub-list for field type_name
}

func init() { file_person_proto_init() }
func file_person_proto_init() {
	if File_person_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_person_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Person); i {
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
	file_person_proto_msgTypes[0].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_person_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_person_proto_goTypes,
		DependencyIndexes: file_person_proto_depIdxs,
		MessageInfos:      file_person_proto_msgTypes,
	}.Build()
	File_person_proto = out.File
	file_person_proto_rawDesc = nil
	file_person_proto_goTypes = nil
	file_person_proto_depIdxs = nil
}
