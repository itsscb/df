package gapi

import (
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func convertAccount(account db.Account) *pb.Account {
	return &pb.Account{
		Id:                  account.ID,
		PermissionLevel:     account.PermissionLevel,
		Email:               account.Email,
		Firstname:           account.Firstname,
		Lastname:            account.Lastname,
		City:                account.City,
		Street:              account.Street,
		Zip:                 account.Zip,
		Country:             account.Country,
		Creator:             account.Creator,
		Changer:             account.Changer,
		PrivacyAccepted:     account.PrivacyAccepted.Bool,
		PrivacyAcceptedDate: timestamppb.New(account.PrivacyAcceptedDate.Time),
		Birthday:            timestamppb.New(account.Birthday),
		Created:             timestamppb.New(account.Created),
		Changed:             timestamppb.New(account.Changed),
		Phone:               account.Phone.String,
	}
}

func convertPerson(person db.Person) *pb.Person {
	return &pb.Person{
		AccountId: person.AccountID,
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
