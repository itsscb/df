// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.24.4
// source: payment.proto

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

type Payment struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id              int64                  `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	AccountId       int64                  `protobuf:"varint,2,opt,name=account_id,json=accountId,proto3" json:"account_id,omitempty"`
	PaymentCategory string                 `protobuf:"bytes,3,opt,name=payment_category,json=paymentCategory,proto3" json:"payment_category,omitempty"`
	Bankname        *string                `protobuf:"bytes,4,opt,name=bankname,proto3,oneof" json:"bankname,omitempty"`
	IBAN            *string                `protobuf:"bytes,5,opt,name=IBAN,proto3,oneof" json:"IBAN,omitempty"`
	BIC             *string                `protobuf:"bytes,6,opt,name=BIC,proto3,oneof" json:"BIC,omitempty"`
	PaypalAccount   *string                `protobuf:"bytes,7,opt,name=paypal_account,json=paypalAccount,proto3,oneof" json:"paypal_account,omitempty"`
	PaypalId        *string                `protobuf:"bytes,8,opt,name=paypal_id,json=paypalId,proto3,oneof" json:"paypal_id,omitempty"`
	PaymentSystem   *string                `protobuf:"bytes,9,opt,name=payment_system,json=paymentSystem,proto3,oneof" json:"payment_system,omitempty"`
	Type            string                 `protobuf:"bytes,10,opt,name=type,proto3" json:"type,omitempty"`
	Creator         string                 `protobuf:"bytes,11,opt,name=creator,proto3" json:"creator,omitempty"`
	Created         *timestamppb.Timestamp `protobuf:"bytes,12,opt,name=created,proto3" json:"created,omitempty"`
	Changer         string                 `protobuf:"bytes,13,opt,name=changer,proto3" json:"changer,omitempty"`
	Changed         *timestamppb.Timestamp `protobuf:"bytes,14,opt,name=changed,proto3" json:"changed,omitempty"`
}

func (x *Payment) Reset() {
	*x = Payment{}
	if protoimpl.UnsafeEnabled {
		mi := &file_payment_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Payment) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Payment) ProtoMessage() {}

func (x *Payment) ProtoReflect() protoreflect.Message {
	mi := &file_payment_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Payment.ProtoReflect.Descriptor instead.
func (*Payment) Descriptor() ([]byte, []int) {
	return file_payment_proto_rawDescGZIP(), []int{0}
}

func (x *Payment) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *Payment) GetAccountId() int64 {
	if x != nil {
		return x.AccountId
	}
	return 0
}

func (x *Payment) GetPaymentCategory() string {
	if x != nil {
		return x.PaymentCategory
	}
	return ""
}

func (x *Payment) GetBankname() string {
	if x != nil && x.Bankname != nil {
		return *x.Bankname
	}
	return ""
}

func (x *Payment) GetIBAN() string {
	if x != nil && x.IBAN != nil {
		return *x.IBAN
	}
	return ""
}

func (x *Payment) GetBIC() string {
	if x != nil && x.BIC != nil {
		return *x.BIC
	}
	return ""
}

func (x *Payment) GetPaypalAccount() string {
	if x != nil && x.PaypalAccount != nil {
		return *x.PaypalAccount
	}
	return ""
}

func (x *Payment) GetPaypalId() string {
	if x != nil && x.PaypalId != nil {
		return *x.PaypalId
	}
	return ""
}

func (x *Payment) GetPaymentSystem() string {
	if x != nil && x.PaymentSystem != nil {
		return *x.PaymentSystem
	}
	return ""
}

func (x *Payment) GetType() string {
	if x != nil {
		return x.Type
	}
	return ""
}

func (x *Payment) GetCreator() string {
	if x != nil {
		return x.Creator
	}
	return ""
}

func (x *Payment) GetCreated() *timestamppb.Timestamp {
	if x != nil {
		return x.Created
	}
	return nil
}

func (x *Payment) GetChanger() string {
	if x != nil {
		return x.Changer
	}
	return ""
}

func (x *Payment) GetChanged() *timestamppb.Timestamp {
	if x != nil {
		return x.Changed
	}
	return nil
}

var File_payment_proto protoreflect.FileDescriptor

var file_payment_proto_rawDesc = []byte{
	0x0a, 0x0d, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12,
	0x02, 0x70, 0x62, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e,
	0x2d, 0x6f, 0x70, 0x65, 0x6e, 0x61, 0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f,
	0x6e, 0x73, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x22, 0xdf, 0x07, 0x0a, 0x07, 0x50, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74,
	0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64,
	0x12, 0x1d, 0x0a, 0x0a, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x03, 0x52, 0x09, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x49, 0x64, 0x12,
	0x29, 0x0a, 0x10, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x5f, 0x63, 0x61, 0x74, 0x65, 0x67,
	0x6f, 0x72, 0x79, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0f, 0x70, 0x61, 0x79, 0x6d, 0x65,
	0x6e, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x12, 0x1f, 0x0a, 0x08, 0x62, 0x61,
	0x6e, 0x6b, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x08,
	0x62, 0x61, 0x6e, 0x6b, 0x6e, 0x61, 0x6d, 0x65, 0x88, 0x01, 0x01, 0x12, 0x17, 0x0a, 0x04, 0x49,
	0x42, 0x41, 0x4e, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x48, 0x01, 0x52, 0x04, 0x49, 0x42, 0x41,
	0x4e, 0x88, 0x01, 0x01, 0x12, 0x15, 0x0a, 0x03, 0x42, 0x49, 0x43, 0x18, 0x06, 0x20, 0x01, 0x28,
	0x09, 0x48, 0x02, 0x52, 0x03, 0x42, 0x49, 0x43, 0x88, 0x01, 0x01, 0x12, 0x2a, 0x0a, 0x0e, 0x70,
	0x61, 0x79, 0x70, 0x61, 0x6c, 0x5f, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x18, 0x07, 0x20,
	0x01, 0x28, 0x09, 0x48, 0x03, 0x52, 0x0d, 0x70, 0x61, 0x79, 0x70, 0x61, 0x6c, 0x41, 0x63, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x88, 0x01, 0x01, 0x12, 0x20, 0x0a, 0x09, 0x70, 0x61, 0x79, 0x70, 0x61,
	0x6c, 0x5f, 0x69, 0x64, 0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x48, 0x04, 0x52, 0x08, 0x70, 0x61,
	0x79, 0x70, 0x61, 0x6c, 0x49, 0x64, 0x88, 0x01, 0x01, 0x12, 0x2a, 0x0a, 0x0e, 0x70, 0x61, 0x79,
	0x6d, 0x65, 0x6e, 0x74, 0x5f, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x18, 0x09, 0x20, 0x01, 0x28,
	0x09, 0x48, 0x05, 0x52, 0x0d, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x53, 0x79, 0x73, 0x74,
	0x65, 0x6d, 0x88, 0x01, 0x01, 0x12, 0x12, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x0a, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x72, 0x65,
	0x61, 0x74, 0x6f, 0x72, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63, 0x72, 0x65, 0x61,
	0x74, 0x6f, 0x72, 0x12, 0x51, 0x0a, 0x07, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x18, 0x0c,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x42, 0x1b, 0x92, 0x41, 0x18, 0x4a, 0x16, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d,
	0x30, 0x35, 0x54, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x52, 0x07, 0x63,
	0x72, 0x65, 0x61, 0x74, 0x65, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65,
	0x72, 0x18, 0x0d, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72,
	0x12, 0x51, 0x0a, 0x07, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x18, 0x0e, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x42, 0x1b, 0x92,
	0x41, 0x18, 0x4a, 0x16, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54,
	0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x5a, 0x22, 0x52, 0x07, 0x63, 0x68, 0x61, 0x6e,
	0x67, 0x65, 0x64, 0x3a, 0xee, 0x02, 0x92, 0x41, 0xea, 0x02, 0x0a, 0x09, 0x2a, 0x07, 0x50, 0x61,
	0x79, 0x6d, 0x65, 0x6e, 0x74, 0x32, 0xdc, 0x02, 0x7b, 0x22, 0x69, 0x64, 0x22, 0x3a, 0x20, 0x22,
	0x31, 0x22, 0x2c, 0x22, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x22, 0x3a,
	0x20, 0x22, 0x31, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x5f, 0x63,
	0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x22, 0x3a, 0x20, 0x22, 0x54, 0x42, 0x44, 0x3a, 0x20,
	0x70, 0x61, 0x79, 0x70, 0x61, 0x6c, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x61, 0x79, 0x70, 0x61, 0x6c,
	0x5f, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e,
	0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d,
	0x22, 0x2c, 0x20, 0x22, 0x70, 0x61, 0x79, 0x70, 0x61, 0x6c, 0x5f, 0x69, 0x64, 0x22, 0x3a, 0x20,
	0x22, 0x74, 0x68, 0x69, 0x73, 0x2d, 0x69, 0x73, 0x2d, 0x61, 0x2d, 0x70, 0x61, 0x79, 0x70, 0x61,
	0x6c, 0x2d, 0x69, 0x64, 0x22, 0x2c, 0x20, 0x22, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x5f,
	0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x22, 0x3a, 0x20, 0x22, 0x54, 0x42, 0x44, 0x3a, 0x20, 0x70,
	0x61, 0x79, 0x70, 0x61, 0x6c, 0x20, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x22, 0x2c, 0x20, 0x22,
	0x74, 0x79, 0x70, 0x65, 0x22, 0x3a, 0x20, 0x22, 0x54, 0x42, 0x44, 0x3a, 0x20, 0x73, 0x6f, 0x6d,
	0x65, 0x20, 0x74, 0x79, 0x70, 0x65, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x72, 0x65, 0x61, 0x74, 0x6f,
	0x72, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e, 0x2e, 0x64, 0x6f, 0x65, 0x40, 0x65, 0x78,
	0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x22, 0x2c, 0x20, 0x22, 0x63, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x22, 0x32, 0x30, 0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d,
	0x30, 0x35, 0x54, 0x30, 0x32, 0x3a, 0x33, 0x30, 0x3a, 0x35, 0x33, 0x5a, 0x22, 0x2c, 0x20, 0x22,
	0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x72, 0x22, 0x3a, 0x20, 0x22, 0x6a, 0x6f, 0x68, 0x6e, 0x2e,
	0x64, 0x6f, 0x65, 0x40, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x22,
	0x2c, 0x20, 0x22, 0x63, 0x68, 0x61, 0x6e, 0x67, 0x65, 0x64, 0x22, 0x3a, 0x20, 0x22, 0x32, 0x30,
	0x32, 0x33, 0x2d, 0x31, 0x30, 0x2d, 0x30, 0x35, 0x54, 0x30, 0x32, 0x3a, 0x33, 0x30, 0x3a, 0x35,
	0x33, 0x5a, 0x22, 0x7d, 0x42, 0x0b, 0x0a, 0x09, 0x5f, 0x62, 0x61, 0x6e, 0x6b, 0x6e, 0x61, 0x6d,
	0x65, 0x42, 0x07, 0x0a, 0x05, 0x5f, 0x49, 0x42, 0x41, 0x4e, 0x42, 0x06, 0x0a, 0x04, 0x5f, 0x42,
	0x49, 0x43, 0x42, 0x11, 0x0a, 0x0f, 0x5f, 0x70, 0x61, 0x79, 0x70, 0x61, 0x6c, 0x5f, 0x61, 0x63,
	0x63, 0x6f, 0x75, 0x6e, 0x74, 0x42, 0x0c, 0x0a, 0x0a, 0x5f, 0x70, 0x61, 0x79, 0x70, 0x61, 0x6c,
	0x5f, 0x69, 0x64, 0x42, 0x11, 0x0a, 0x0f, 0x5f, 0x70, 0x61, 0x79, 0x6d, 0x65, 0x6e, 0x74, 0x5f,
	0x73, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x42, 0x19, 0x5a, 0x17, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62,
	0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x69, 0x74, 0x73, 0x73, 0x63, 0x62, 0x2f, 0x64, 0x66, 0x2f, 0x70,
	0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_payment_proto_rawDescOnce sync.Once
	file_payment_proto_rawDescData = file_payment_proto_rawDesc
)

func file_payment_proto_rawDescGZIP() []byte {
	file_payment_proto_rawDescOnce.Do(func() {
		file_payment_proto_rawDescData = protoimpl.X.CompressGZIP(file_payment_proto_rawDescData)
	})
	return file_payment_proto_rawDescData
}

var file_payment_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_payment_proto_goTypes = []interface{}{
	(*Payment)(nil),               // 0: pb.Payment
	(*timestamppb.Timestamp)(nil), // 1: google.protobuf.Timestamp
}
var file_payment_proto_depIdxs = []int32{
	1, // 0: pb.Payment.created:type_name -> google.protobuf.Timestamp
	1, // 1: pb.Payment.changed:type_name -> google.protobuf.Timestamp
	2, // [2:2] is the sub-list for method output_type
	2, // [2:2] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_payment_proto_init() }
func file_payment_proto_init() {
	if File_payment_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_payment_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Payment); i {
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
	file_payment_proto_msgTypes[0].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_payment_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_payment_proto_goTypes,
		DependencyIndexes: file_payment_proto_depIdxs,
		MessageInfos:      file_payment_proto_msgTypes,
	}.Build()
	File_payment_proto = out.File
	file_payment_proto_rawDesc = nil
	file_payment_proto_goTypes = nil
	file_payment_proto_depIdxs = nil
}
