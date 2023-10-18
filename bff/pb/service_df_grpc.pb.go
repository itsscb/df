// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             v4.24.4
// source: service_df.proto

package pb

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

const (
	Df_Login_FullMethodName                = "/pb.df/Login"
	Df_RefreshToken_FullMethodName         = "/pb.df/RefreshToken"
	Df_ListSessions_FullMethodName         = "/pb.df/ListSessions"
	Df_BlockSession_FullMethodName         = "/pb.df/BlockSession"
	Df_GetAccount_FullMethodName           = "/pb.df/GetAccount"
	Df_ListAccounts_FullMethodName         = "/pb.df/ListAccounts"
	Df_CreateAccount_FullMethodName        = "/pb.df/CreateAccount"
	Df_UpdateAccount_FullMethodName        = "/pb.df/UpdateAccount"
	Df_UpdateAccountPrivacy_FullMethodName = "/pb.df/UpdateAccountPrivacy"
	Df_CreatePerson_FullMethodName         = "/pb.df/CreatePerson"
	Df_UpdatePerson_FullMethodName         = "/pb.df/UpdatePerson"
	Df_GetPerson_FullMethodName            = "/pb.df/GetPerson"
	Df_DeletePerson_FullMethodName         = "/pb.df/DeletePerson"
	Df_ListPersons_FullMethodName          = "/pb.df/ListPersons"
	Df_CreatePayment_FullMethodName        = "/pb.df/CreatePayment"
	Df_GetPayment_FullMethodName           = "/pb.df/GetPayment"
	Df_DeletePayment_FullMethodName        = "/pb.df/DeletePayment"
	Df_ListPayments_FullMethodName         = "/pb.df/ListPayments"
	Df_UpdatePayment_FullMethodName        = "/pb.df/UpdatePayment"
	Df_ListReturnsLog_FullMethodName       = "/pb.df/ListReturnsLog"
	Df_UploadDocument_FullMethodName       = "/pb.df/UploadDocument"
	Df_DeleteDocument_FullMethodName       = "/pb.df/DeleteDocument"
	Df_VerifyEmail_FullMethodName          = "/pb.df/VerifyEmail"
)

// DfClient is the client API for Df service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type DfClient interface {
	Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error)
	RefreshToken(ctx context.Context, in *RefreshTokenRequest, opts ...grpc.CallOption) (*RefreshTokenResponse, error)
	ListSessions(ctx context.Context, in *ListSessionsRequest, opts ...grpc.CallOption) (*ListSessionsResponse, error)
	BlockSession(ctx context.Context, in *BlockSessionRequest, opts ...grpc.CallOption) (*BlockSessionResponse, error)
	GetAccount(ctx context.Context, in *GetAccountRequest, opts ...grpc.CallOption) (*GetAccountResponse, error)
	ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error)
	CreateAccount(ctx context.Context, in *CreateAccountRequest, opts ...grpc.CallOption) (*CreateAccountResponse, error)
	UpdateAccount(ctx context.Context, in *UpdateAccountRequest, opts ...grpc.CallOption) (*UpdateAccountResponse, error)
	UpdateAccountPrivacy(ctx context.Context, in *UpdateAccountPrivacyRequest, opts ...grpc.CallOption) (*UpdateAccountPrivacyResponse, error)
	CreatePerson(ctx context.Context, in *CreatePersonRequest, opts ...grpc.CallOption) (*CreatePersonResponse, error)
	UpdatePerson(ctx context.Context, in *UpdatePersonRequest, opts ...grpc.CallOption) (*UpdatePersonResponse, error)
	GetPerson(ctx context.Context, in *GetPersonRequest, opts ...grpc.CallOption) (*GetPersonResponse, error)
	DeletePerson(ctx context.Context, in *DeletePersonRequest, opts ...grpc.CallOption) (*DeletePersonResponse, error)
	ListPersons(ctx context.Context, in *ListPersonsRequest, opts ...grpc.CallOption) (*ListPersonsResponse, error)
	CreatePayment(ctx context.Context, in *CreatePaymentRequest, opts ...grpc.CallOption) (*CreatePaymentResponse, error)
	GetPayment(ctx context.Context, in *GetPaymentRequest, opts ...grpc.CallOption) (*GetPaymentResponse, error)
	DeletePayment(ctx context.Context, in *DeletePaymentRequest, opts ...grpc.CallOption) (*DeletePaymentResponse, error)
	ListPayments(ctx context.Context, in *ListPaymentsRequest, opts ...grpc.CallOption) (*ListPaymentsResponse, error)
	UpdatePayment(ctx context.Context, in *UpdatePaymentRequest, opts ...grpc.CallOption) (*UpdatePaymentResponse, error)
	ListReturnsLog(ctx context.Context, in *ListReturnsLogRequest, opts ...grpc.CallOption) (*ListReturnsLogResponse, error)
	UploadDocument(ctx context.Context, in *UploadDocumentRequest, opts ...grpc.CallOption) (*UploadDocumentResponse, error)
	DeleteDocument(ctx context.Context, in *DeleteDocumentRequest, opts ...grpc.CallOption) (*DeleteDocumentResponse, error)
	VerifyEmail(ctx context.Context, in *VerifyEmailRequest, opts ...grpc.CallOption) (*VerifyEmailResponse, error)
}

type dfClient struct {
	cc grpc.ClientConnInterface
}

func NewDfClient(cc grpc.ClientConnInterface) DfClient {
	return &dfClient{cc}
}

func (c *dfClient) Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error) {
	out := new(LoginResponse)
	err := c.cc.Invoke(ctx, Df_Login_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) RefreshToken(ctx context.Context, in *RefreshTokenRequest, opts ...grpc.CallOption) (*RefreshTokenResponse, error) {
	out := new(RefreshTokenResponse)
	err := c.cc.Invoke(ctx, Df_RefreshToken_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) ListSessions(ctx context.Context, in *ListSessionsRequest, opts ...grpc.CallOption) (*ListSessionsResponse, error) {
	out := new(ListSessionsResponse)
	err := c.cc.Invoke(ctx, Df_ListSessions_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) BlockSession(ctx context.Context, in *BlockSessionRequest, opts ...grpc.CallOption) (*BlockSessionResponse, error) {
	out := new(BlockSessionResponse)
	err := c.cc.Invoke(ctx, Df_BlockSession_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) GetAccount(ctx context.Context, in *GetAccountRequest, opts ...grpc.CallOption) (*GetAccountResponse, error) {
	out := new(GetAccountResponse)
	err := c.cc.Invoke(ctx, Df_GetAccount_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) ListAccounts(ctx context.Context, in *ListAccountsRequest, opts ...grpc.CallOption) (*ListAccountsResponse, error) {
	out := new(ListAccountsResponse)
	err := c.cc.Invoke(ctx, Df_ListAccounts_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) CreateAccount(ctx context.Context, in *CreateAccountRequest, opts ...grpc.CallOption) (*CreateAccountResponse, error) {
	out := new(CreateAccountResponse)
	err := c.cc.Invoke(ctx, Df_CreateAccount_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) UpdateAccount(ctx context.Context, in *UpdateAccountRequest, opts ...grpc.CallOption) (*UpdateAccountResponse, error) {
	out := new(UpdateAccountResponse)
	err := c.cc.Invoke(ctx, Df_UpdateAccount_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) UpdateAccountPrivacy(ctx context.Context, in *UpdateAccountPrivacyRequest, opts ...grpc.CallOption) (*UpdateAccountPrivacyResponse, error) {
	out := new(UpdateAccountPrivacyResponse)
	err := c.cc.Invoke(ctx, Df_UpdateAccountPrivacy_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) CreatePerson(ctx context.Context, in *CreatePersonRequest, opts ...grpc.CallOption) (*CreatePersonResponse, error) {
	out := new(CreatePersonResponse)
	err := c.cc.Invoke(ctx, Df_CreatePerson_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) UpdatePerson(ctx context.Context, in *UpdatePersonRequest, opts ...grpc.CallOption) (*UpdatePersonResponse, error) {
	out := new(UpdatePersonResponse)
	err := c.cc.Invoke(ctx, Df_UpdatePerson_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) GetPerson(ctx context.Context, in *GetPersonRequest, opts ...grpc.CallOption) (*GetPersonResponse, error) {
	out := new(GetPersonResponse)
	err := c.cc.Invoke(ctx, Df_GetPerson_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) DeletePerson(ctx context.Context, in *DeletePersonRequest, opts ...grpc.CallOption) (*DeletePersonResponse, error) {
	out := new(DeletePersonResponse)
	err := c.cc.Invoke(ctx, Df_DeletePerson_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) ListPersons(ctx context.Context, in *ListPersonsRequest, opts ...grpc.CallOption) (*ListPersonsResponse, error) {
	out := new(ListPersonsResponse)
	err := c.cc.Invoke(ctx, Df_ListPersons_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) CreatePayment(ctx context.Context, in *CreatePaymentRequest, opts ...grpc.CallOption) (*CreatePaymentResponse, error) {
	out := new(CreatePaymentResponse)
	err := c.cc.Invoke(ctx, Df_CreatePayment_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) GetPayment(ctx context.Context, in *GetPaymentRequest, opts ...grpc.CallOption) (*GetPaymentResponse, error) {
	out := new(GetPaymentResponse)
	err := c.cc.Invoke(ctx, Df_GetPayment_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) DeletePayment(ctx context.Context, in *DeletePaymentRequest, opts ...grpc.CallOption) (*DeletePaymentResponse, error) {
	out := new(DeletePaymentResponse)
	err := c.cc.Invoke(ctx, Df_DeletePayment_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) ListPayments(ctx context.Context, in *ListPaymentsRequest, opts ...grpc.CallOption) (*ListPaymentsResponse, error) {
	out := new(ListPaymentsResponse)
	err := c.cc.Invoke(ctx, Df_ListPayments_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) UpdatePayment(ctx context.Context, in *UpdatePaymentRequest, opts ...grpc.CallOption) (*UpdatePaymentResponse, error) {
	out := new(UpdatePaymentResponse)
	err := c.cc.Invoke(ctx, Df_UpdatePayment_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) ListReturnsLog(ctx context.Context, in *ListReturnsLogRequest, opts ...grpc.CallOption) (*ListReturnsLogResponse, error) {
	out := new(ListReturnsLogResponse)
	err := c.cc.Invoke(ctx, Df_ListReturnsLog_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) UploadDocument(ctx context.Context, in *UploadDocumentRequest, opts ...grpc.CallOption) (*UploadDocumentResponse, error) {
	out := new(UploadDocumentResponse)
	err := c.cc.Invoke(ctx, Df_UploadDocument_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) DeleteDocument(ctx context.Context, in *DeleteDocumentRequest, opts ...grpc.CallOption) (*DeleteDocumentResponse, error) {
	out := new(DeleteDocumentResponse)
	err := c.cc.Invoke(ctx, Df_DeleteDocument_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *dfClient) VerifyEmail(ctx context.Context, in *VerifyEmailRequest, opts ...grpc.CallOption) (*VerifyEmailResponse, error) {
	out := new(VerifyEmailResponse)
	err := c.cc.Invoke(ctx, Df_VerifyEmail_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// DfServer is the server API for Df service.
// All implementations must embed UnimplementedDfServer
// for forward compatibility
type DfServer interface {
	Login(context.Context, *LoginRequest) (*LoginResponse, error)
	RefreshToken(context.Context, *RefreshTokenRequest) (*RefreshTokenResponse, error)
	ListSessions(context.Context, *ListSessionsRequest) (*ListSessionsResponse, error)
	BlockSession(context.Context, *BlockSessionRequest) (*BlockSessionResponse, error)
	GetAccount(context.Context, *GetAccountRequest) (*GetAccountResponse, error)
	ListAccounts(context.Context, *ListAccountsRequest) (*ListAccountsResponse, error)
	CreateAccount(context.Context, *CreateAccountRequest) (*CreateAccountResponse, error)
	UpdateAccount(context.Context, *UpdateAccountRequest) (*UpdateAccountResponse, error)
	UpdateAccountPrivacy(context.Context, *UpdateAccountPrivacyRequest) (*UpdateAccountPrivacyResponse, error)
	CreatePerson(context.Context, *CreatePersonRequest) (*CreatePersonResponse, error)
	UpdatePerson(context.Context, *UpdatePersonRequest) (*UpdatePersonResponse, error)
	GetPerson(context.Context, *GetPersonRequest) (*GetPersonResponse, error)
	DeletePerson(context.Context, *DeletePersonRequest) (*DeletePersonResponse, error)
	ListPersons(context.Context, *ListPersonsRequest) (*ListPersonsResponse, error)
	CreatePayment(context.Context, *CreatePaymentRequest) (*CreatePaymentResponse, error)
	GetPayment(context.Context, *GetPaymentRequest) (*GetPaymentResponse, error)
	DeletePayment(context.Context, *DeletePaymentRequest) (*DeletePaymentResponse, error)
	ListPayments(context.Context, *ListPaymentsRequest) (*ListPaymentsResponse, error)
	UpdatePayment(context.Context, *UpdatePaymentRequest) (*UpdatePaymentResponse, error)
	ListReturnsLog(context.Context, *ListReturnsLogRequest) (*ListReturnsLogResponse, error)
	UploadDocument(context.Context, *UploadDocumentRequest) (*UploadDocumentResponse, error)
	DeleteDocument(context.Context, *DeleteDocumentRequest) (*DeleteDocumentResponse, error)
	VerifyEmail(context.Context, *VerifyEmailRequest) (*VerifyEmailResponse, error)
	mustEmbedUnimplementedDfServer()
}

// UnimplementedDfServer must be embedded to have forward compatible implementations.
type UnimplementedDfServer struct {
}

func (UnimplementedDfServer) Login(context.Context, *LoginRequest) (*LoginResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Login not implemented")
}
func (UnimplementedDfServer) RefreshToken(context.Context, *RefreshTokenRequest) (*RefreshTokenResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method RefreshToken not implemented")
}
func (UnimplementedDfServer) ListSessions(context.Context, *ListSessionsRequest) (*ListSessionsResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListSessions not implemented")
}
func (UnimplementedDfServer) BlockSession(context.Context, *BlockSessionRequest) (*BlockSessionResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method BlockSession not implemented")
}
func (UnimplementedDfServer) GetAccount(context.Context, *GetAccountRequest) (*GetAccountResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAccount not implemented")
}
func (UnimplementedDfServer) ListAccounts(context.Context, *ListAccountsRequest) (*ListAccountsResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListAccounts not implemented")
}
func (UnimplementedDfServer) CreateAccount(context.Context, *CreateAccountRequest) (*CreateAccountResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateAccount not implemented")
}
func (UnimplementedDfServer) UpdateAccount(context.Context, *UpdateAccountRequest) (*UpdateAccountResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateAccount not implemented")
}
func (UnimplementedDfServer) UpdateAccountPrivacy(context.Context, *UpdateAccountPrivacyRequest) (*UpdateAccountPrivacyResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateAccountPrivacy not implemented")
}
func (UnimplementedDfServer) CreatePerson(context.Context, *CreatePersonRequest) (*CreatePersonResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreatePerson not implemented")
}
func (UnimplementedDfServer) UpdatePerson(context.Context, *UpdatePersonRequest) (*UpdatePersonResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdatePerson not implemented")
}
func (UnimplementedDfServer) GetPerson(context.Context, *GetPersonRequest) (*GetPersonResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetPerson not implemented")
}
func (UnimplementedDfServer) DeletePerson(context.Context, *DeletePersonRequest) (*DeletePersonResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeletePerson not implemented")
}
func (UnimplementedDfServer) ListPersons(context.Context, *ListPersonsRequest) (*ListPersonsResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListPersons not implemented")
}
func (UnimplementedDfServer) CreatePayment(context.Context, *CreatePaymentRequest) (*CreatePaymentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreatePayment not implemented")
}
func (UnimplementedDfServer) GetPayment(context.Context, *GetPaymentRequest) (*GetPaymentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetPayment not implemented")
}
func (UnimplementedDfServer) DeletePayment(context.Context, *DeletePaymentRequest) (*DeletePaymentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeletePayment not implemented")
}
func (UnimplementedDfServer) ListPayments(context.Context, *ListPaymentsRequest) (*ListPaymentsResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListPayments not implemented")
}
func (UnimplementedDfServer) UpdatePayment(context.Context, *UpdatePaymentRequest) (*UpdatePaymentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdatePayment not implemented")
}
func (UnimplementedDfServer) ListReturnsLog(context.Context, *ListReturnsLogRequest) (*ListReturnsLogResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListReturnsLog not implemented")
}
func (UnimplementedDfServer) UploadDocument(context.Context, *UploadDocumentRequest) (*UploadDocumentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UploadDocument not implemented")
}
func (UnimplementedDfServer) DeleteDocument(context.Context, *DeleteDocumentRequest) (*DeleteDocumentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteDocument not implemented")
}
func (UnimplementedDfServer) VerifyEmail(context.Context, *VerifyEmailRequest) (*VerifyEmailResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method VerifyEmail not implemented")
}
func (UnimplementedDfServer) mustEmbedUnimplementedDfServer() {}

// UnsafeDfServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to DfServer will
// result in compilation errors.
type UnsafeDfServer interface {
	mustEmbedUnimplementedDfServer()
}

func RegisterDfServer(s grpc.ServiceRegistrar, srv DfServer) {
	s.RegisterService(&Df_ServiceDesc, srv)
}

func _Df_Login_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(LoginRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).Login(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_Login_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).Login(ctx, req.(*LoginRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_RefreshToken_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(RefreshTokenRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).RefreshToken(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_RefreshToken_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).RefreshToken(ctx, req.(*RefreshTokenRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_ListSessions_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListSessionsRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).ListSessions(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_ListSessions_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).ListSessions(ctx, req.(*ListSessionsRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_BlockSession_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(BlockSessionRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).BlockSession(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_BlockSession_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).BlockSession(ctx, req.(*BlockSessionRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_GetAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetAccountRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).GetAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_GetAccount_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).GetAccount(ctx, req.(*GetAccountRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_ListAccounts_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListAccountsRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).ListAccounts(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_ListAccounts_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).ListAccounts(ctx, req.(*ListAccountsRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_CreateAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateAccountRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).CreateAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_CreateAccount_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).CreateAccount(ctx, req.(*CreateAccountRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_UpdateAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateAccountRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).UpdateAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_UpdateAccount_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).UpdateAccount(ctx, req.(*UpdateAccountRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_UpdateAccountPrivacy_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateAccountPrivacyRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).UpdateAccountPrivacy(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_UpdateAccountPrivacy_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).UpdateAccountPrivacy(ctx, req.(*UpdateAccountPrivacyRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_CreatePerson_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreatePersonRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).CreatePerson(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_CreatePerson_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).CreatePerson(ctx, req.(*CreatePersonRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_UpdatePerson_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdatePersonRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).UpdatePerson(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_UpdatePerson_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).UpdatePerson(ctx, req.(*UpdatePersonRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_GetPerson_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetPersonRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).GetPerson(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_GetPerson_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).GetPerson(ctx, req.(*GetPersonRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_DeletePerson_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeletePersonRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).DeletePerson(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_DeletePerson_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).DeletePerson(ctx, req.(*DeletePersonRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_ListPersons_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListPersonsRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).ListPersons(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_ListPersons_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).ListPersons(ctx, req.(*ListPersonsRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_CreatePayment_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreatePaymentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).CreatePayment(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_CreatePayment_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).CreatePayment(ctx, req.(*CreatePaymentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_GetPayment_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetPaymentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).GetPayment(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_GetPayment_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).GetPayment(ctx, req.(*GetPaymentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_DeletePayment_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeletePaymentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).DeletePayment(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_DeletePayment_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).DeletePayment(ctx, req.(*DeletePaymentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_ListPayments_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListPaymentsRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).ListPayments(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_ListPayments_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).ListPayments(ctx, req.(*ListPaymentsRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_UpdatePayment_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdatePaymentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).UpdatePayment(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_UpdatePayment_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).UpdatePayment(ctx, req.(*UpdatePaymentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_ListReturnsLog_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListReturnsLogRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).ListReturnsLog(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_ListReturnsLog_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).ListReturnsLog(ctx, req.(*ListReturnsLogRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_UploadDocument_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UploadDocumentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).UploadDocument(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_UploadDocument_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).UploadDocument(ctx, req.(*UploadDocumentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_DeleteDocument_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeleteDocumentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).DeleteDocument(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_DeleteDocument_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).DeleteDocument(ctx, req.(*DeleteDocumentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Df_VerifyEmail_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(VerifyEmailRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DfServer).VerifyEmail(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: Df_VerifyEmail_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DfServer).VerifyEmail(ctx, req.(*VerifyEmailRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Df_ServiceDesc is the grpc.ServiceDesc for Df service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Df_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "pb.df",
	HandlerType: (*DfServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Login",
			Handler:    _Df_Login_Handler,
		},
		{
			MethodName: "RefreshToken",
			Handler:    _Df_RefreshToken_Handler,
		},
		{
			MethodName: "ListSessions",
			Handler:    _Df_ListSessions_Handler,
		},
		{
			MethodName: "BlockSession",
			Handler:    _Df_BlockSession_Handler,
		},
		{
			MethodName: "GetAccount",
			Handler:    _Df_GetAccount_Handler,
		},
		{
			MethodName: "ListAccounts",
			Handler:    _Df_ListAccounts_Handler,
		},
		{
			MethodName: "CreateAccount",
			Handler:    _Df_CreateAccount_Handler,
		},
		{
			MethodName: "UpdateAccount",
			Handler:    _Df_UpdateAccount_Handler,
		},
		{
			MethodName: "UpdateAccountPrivacy",
			Handler:    _Df_UpdateAccountPrivacy_Handler,
		},
		{
			MethodName: "CreatePerson",
			Handler:    _Df_CreatePerson_Handler,
		},
		{
			MethodName: "UpdatePerson",
			Handler:    _Df_UpdatePerson_Handler,
		},
		{
			MethodName: "GetPerson",
			Handler:    _Df_GetPerson_Handler,
		},
		{
			MethodName: "DeletePerson",
			Handler:    _Df_DeletePerson_Handler,
		},
		{
			MethodName: "ListPersons",
			Handler:    _Df_ListPersons_Handler,
		},
		{
			MethodName: "CreatePayment",
			Handler:    _Df_CreatePayment_Handler,
		},
		{
			MethodName: "GetPayment",
			Handler:    _Df_GetPayment_Handler,
		},
		{
			MethodName: "DeletePayment",
			Handler:    _Df_DeletePayment_Handler,
		},
		{
			MethodName: "ListPayments",
			Handler:    _Df_ListPayments_Handler,
		},
		{
			MethodName: "UpdatePayment",
			Handler:    _Df_UpdatePayment_Handler,
		},
		{
			MethodName: "ListReturnsLog",
			Handler:    _Df_ListReturnsLog_Handler,
		},
		{
			MethodName: "UploadDocument",
			Handler:    _Df_UploadDocument_Handler,
		},
		{
			MethodName: "DeleteDocument",
			Handler:    _Df_DeleteDocument_Handler,
		},
		{
			MethodName: "VerifyEmail",
			Handler:    _Df_VerifyEmail_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "service_df.proto",
}
