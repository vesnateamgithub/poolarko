package models

type User struct {
	ID       int32  `json:"id"`
	Name     string `json:"name"     validate:"required,max=255"`
	Email    string `json:"email"    validate:"required,email,max=255"`
	Password string `json:"password" validate:"min=8,max=255"`
}
