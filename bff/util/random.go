package util

import (
	"math/rand"
	"strings"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"
const numbers = "0123456789"

// RandomInt generates a random number between min and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// RandomString generates a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// RandomPhone generates a random phone number as string
func RandomPhone() string {
	var sb strings.Builder
	k := len(numbers)

	for i := 0; i <= 12; i++ {
		c := numbers[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// RandomName generates a random name
func RandomName() string {
	n := RandomInt(3, 12)
	return RandomString(int(n))
}

// RandomEmail generates a random email address
func RandomEmail() string {
	var s string
	s += RandomString(10)
	s += "@"
	s += RandomString(10)
	s += "."
	s += RandomString(2)
	return s
}
