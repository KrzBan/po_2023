package database

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"

	. "myapp/models"
)

func CreateDB() (db *gorm.DB) {
	db, err := gorm.Open(sqlite.Open("test.database"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// Migrate the schema
	err = db.AutoMigrate(&Weather{})
	if err != nil {
		return
	}

	// Create
	db.Create(&Weather{Type: "Windy", City: "Cracov"})
	db.Create(&Weather{Type: "Sunny", City: "Gdynia"})
	db.Create(&Weather{Type: "Cloudy", City: "Szczecin"})
	db.Create(&Weather{Type: "Acid-Rain", City: "Warsaw"})

	return db
}
