package models

import "gorm.io/gorm"

type Weather struct {
	gorm.Model
	Type string
	City string
}
