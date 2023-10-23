package val

import (
	"fmt"
	"net/mail"
	"regexp"
)

var (
	IsValidName          = regexp.MustCompile(`^[a-zA-Z\s]+$`).MatchString
	IsValidAlphaSpace    = regexp.MustCompile(`^[a-zA-Z\s]+$`).MatchString
	IsValidAlphaNumSpace = regexp.MustCompile(`^[a-zA-Z0-9\s]+$`).MatchString
)

func ValidateString(value string, minLength int, maxLength int) error {
	n := len(value)
	if n < minLength || n > maxLength {
		return fmt.Errorf("must contain from %d-%d characters", minLength, maxLength)
	}
	return nil
}

func ValidateName(value string) error {
	if err := ValidateString(value, 2, 40); err != nil {
		return err
	}
	if !IsValidName(value) {
		return fmt.Errorf("must contain only letters or spaces")
	}
	return nil
}

func ValidatePassword(value string) error {
	return ValidateString(value, 6, 100)
}

func ValidateEmail(value string) error {
	if err := ValidateString(value, 3, 200); err != nil {
		return err
	}
	if _, err := mail.ParseAddress(value); err != nil {
		return fmt.Errorf("is not a valid email address")
	}
	return nil
}

func ValidateEmailId(value int64) error {
	if value < 1 {
		return fmt.Errorf("must be a positive integer")
	}
	return nil
}

func ValidateStreet(value string) error {
	if err := ValidateString(value, 4, 100); err != nil {
		return err
	}

	if !IsValidAlphaNumSpace(value) {
		return fmt.Errorf("must contain only letters, numbers or spaces")
	}

	return nil
}

func ValidateAlphaSpace(value string) error {
	if err := ValidateString(value, 3, 100); err != nil {
		return err
	}

	if !IsValidAlphaSpace(value) {
		return fmt.Errorf("must contain only letters, numbers or spaces")
	}

	return nil
}

func ValidateSecretCode(value string) error {
	return ValidateString(value, 32, 128)
}
