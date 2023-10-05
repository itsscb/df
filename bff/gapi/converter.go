package gapi

import (
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func convertAccount(user db.Account) *pb.Account {
	return &pb.Account{
		Id:                  user.ID,
		PermissionLevel:     user.PermissionLevel,
		Email:               user.Email,
		Firstname:           user.Firstname,
		Lastname:            user.Lastname,
		City:                user.City,
		Street:              user.Street,
		Zip:                 user.Zip,
		Country:             user.Country,
		Creator:             user.Creator,
		Changer:             user.Changer,
		PrivacyAccepted:     user.PrivacyAccepted.Bool,
		PrivacyAcceptedDate: timestamppb.New(user.PrivacyAcceptedDate.Time),
		Birthday:            timestamppb.New(user.Birthday),
		Created:             timestamppb.New(user.Created),
		Changed:             timestamppb.New(user.Changed),
		Phone:               user.Phone.String,
	}
}
