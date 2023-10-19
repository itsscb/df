package gapi

import (
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func convertAccount(account db.Account) *pb.Account {
	return &pb.Account{
		Id:              account.ID,
		PermissionLevel: account.PermissionLevel,
		Email:           account.Email,
		SecretKey:       &account.SecretKey.String,
	}
}

func convertAccountInfo(account_info db.AccountInfo) *pb.AccountInfo {
	return &pb.AccountInfo{
		AccountId:           account_info.AccountID,
		Firstname:           account_info.Firstname,
		Lastname:            account_info.Lastname,
		City:                account_info.City,
		Street:              account_info.Street,
		Zip:                 account_info.Zip,
		Country:             account_info.Country,
		Creator:             account_info.Creator,
		Changer:             account_info.Changer,
		PrivacyAccepted:     account_info.PrivacyAccepted.Bool,
		PrivacyAcceptedDate: timestamppb.New(account_info.PrivacyAcceptedDate.Time),
		Birthday:            timestamppb.New(account_info.Birthday),
		Created:             timestamppb.New(account_info.Created),
		Changed:             timestamppb.New(account_info.Changed),
		Phone:               account_info.Phone.String,
	}
}

func convertPerson(person db.Person) *pb.Person {
	return &pb.Person{
		Id:        person.ID,
		AccountId: uint64(person.AccountID),
		Firstname: person.Firstname,
		Lastname:  person.Lastname,
		Street:    person.Street,
		Country:   person.Country,
		Zip:       person.Zip,
		Creator:   person.Creator,
		Changer:   person.Changer,
		City:      person.City,
		Birthday:  timestamppb.New(person.Birthday),
		Created:   timestamppb.New(person.Created),
		Changed:   timestamppb.New(person.Changed),
	}
}

func convertSession(session db.Session) *pb.Session {
	return &pb.Session{
		Id:           session.ID.String(),
		AccountId:    session.AccountID,
		ClientIp:     session.ClientIp,
		UserAgent:    session.UserAgent,
		RefreshToken: session.RefreshToken,
		ExpiresAt:    timestamppb.New(session.ExpiresAt),
		CreatedAt:    timestamppb.New(session.CreatedAt),
		IsBlocked:    session.IsBlocked,
	}
}

func convertPayment(payment db.Payment) *pb.Payment {
	return &pb.Payment{
		Id:              payment.ID,
		AccountId:       uint64(payment.AccountID),
		PaymentCategory: payment.PaymentCategory,
		Bankname:        &payment.Bankname.String,
		IBAN:            &payment.IBAN.String,
		BIC:             &payment.BIC.String,
		PaypalAccount:   &payment.PaypalAccount.String,
		PaypalId:        &payment.PaypalID.String,
		PaymentSystem:   &payment.PaymentSystem.String,
		Type:            payment.Type,
		Creator:         payment.Creator,
		Created:         timestamppb.New(payment.Created),
		Changer:         payment.Changer,
		Changed:         timestamppb.New(payment.Changed),
	}
}

func convertReturnsLog(returnsLog db.ReturnsLog) *pb.ReturnsLog {
	return &pb.ReturnsLog{
		Id:       returnsLog.ID,
		ReturnId: returnsLog.ReturnID,
		MailId:   returnsLog.MailID,
		Status:   returnsLog.Status,
		Creator:  returnsLog.Creator,
		Changer:  returnsLog.Changer,
		Created:  timestamppb.New(returnsLog.Created),
		Changed:  timestamppb.New(returnsLog.Changed),
	}
}
