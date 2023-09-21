// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0

package db

import (
	"database/sql"
	"time"
)

type Account struct {
	ID                  int64          `json:"ID"`
	Username            string         `json:"username"`
	Passwordhash        string         `json:"passwordhash"`
	Firstname           string         `json:"firstname"`
	Lastname            string         `json:"lastname"`
	Birthday            time.Time      `json:"birthday"`
	PrivacyAccepted     bool           `json:"privacyAccepted"`
	PrivacyAcceptedDate sql.NullTime   `json:"privacyAcceptedDate"`
	Email               string         `json:"email"`
	Phone               sql.NullString `json:"phone"`
	City                string         `json:"city"`
	Zip                 string         `json:"zip"`
	Street              string         `json:"street"`
	Country             string         `json:"country"`
	Token               sql.NullString `json:"token"`
	TokenValid          sql.NullBool   `json:"tokenValid"`
	TokenExpiration     time.Time      `json:"tokenExpiration"`
	Creator             string         `json:"creator"`
	Created             time.Time      `json:"created"`
	Changer             string         `json:"changer"`
	Changed             time.Time      `json:"changed"`
}

type Document struct {
	ID          int64          `json:"ID"`
	PersonID    sql.NullInt64  `json:"personID"`
	Name        string         `json:"name"`
	Type        string         `json:"type"`
	Path        string         `json:"path"`
	Url         string         `json:"url"`
	Valid       bool           `json:"valid"`
	ValidDate   sql.NullTime   `json:"validDate"`
	ValidatedBy sql.NullString `json:"validatedBy"`
	MailID      sql.NullInt64  `json:"mailID"`
	Creator     string         `json:"creator"`
	Created     time.Time      `json:"created"`
	Changer     string         `json:"changer"`
	Changed     time.Time      `json:"changed"`
}

type Mail struct {
	ID        int64     `json:"ID"`
	From      string    `json:"from"`
	To        []string  `json:"to"`
	Cc        []string  `json:"cc"`
	Timestamp time.Time `json:"timestamp"`
	Subject   string    `json:"subject"`
	Body      string    `json:"body"`
	Creator   string    `json:"creator"`
	Created   time.Time `json:"created"`
	Changer   string    `json:"changer"`
	Changed   time.Time `json:"changed"`
}

type Payment struct {
	ID              int64          `json:"ID"`
	AccountID       int64          `json:"accountID"`
	PaymentCategory string         `json:"paymentCategory"`
	Bankname        sql.NullString `json:"bankname"`
	IBAN            sql.NullString `json:"IBAN"`
	BIC             sql.NullString `json:"BIC"`
	PaypalAccount   sql.NullString `json:"paypalAccount"`
	PaypalID        sql.NullString `json:"paypalID"`
	PaymentSystem   sql.NullString `json:"paymentSystem"`
	Type            string         `json:"type"`
	Creator         string         `json:"creator"`
	Created         time.Time      `json:"created"`
	Changer         string         `json:"changer"`
	Changed         time.Time      `json:"changed"`
}

type Person struct {
	ID        int64     `json:"ID"`
	AccountID int64     `json:"accountID"`
	Firstname string    `json:"firstname"`
	Lastname  string    `json:"lastname"`
	Birthday  time.Time `json:"birthday"`
	City      string    `json:"city"`
	Zip       string    `json:"zip"`
	Street    string    `json:"street"`
	Country   string    `json:"country"`
	Creator   string    `json:"creator"`
	Created   time.Time `json:"created"`
	Changer   string    `json:"changer"`
	Changed   time.Time `json:"changed"`
}

type Provider struct {
	ID          int64     `json:"ID"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	Category    string    `json:"category"`
	Email       string    `json:"email"`
	Creator     string    `json:"creator"`
	Created     time.Time `json:"created"`
	Changer     string    `json:"changer"`
	Changed     time.Time `json:"changed"`
}

type Return struct {
	ID          int64     `json:"ID"`
	PersonID    int64     `json:"personID"`
	ProviderID  int64     `json:"providerID"`
	Name        string    `json:"name"`
	Description string    `json:"description"`
	Category    string    `json:"category"`
	Email       string    `json:"email"`
	Status      string    `json:"status"`
	Creator     string    `json:"creator"`
	Created     time.Time `json:"created"`
	Changer     string    `json:"changer"`
	Changed     time.Time `json:"changed"`
}

type ReturnsLog struct {
	ID       int64          `json:"ID"`
	ReturnID int64          `json:"returnID"`
	MailID   int64          `json:"mailID"`
	Status   sql.NullString `json:"status"`
	Creator  string         `json:"creator"`
	Created  time.Time      `json:"created"`
	Changer  string         `json:"changer"`
	Changed  time.Time      `json:"changed"`
}
