package controllers

import (
	"github.com/labstack/echo/v4"
	"myapp/database"
	. "myapp/models"
	"net/http"
	"strconv"
	"sync"
)

var (
	lock = sync.Mutex{}
	db   = database.CreateDB()
)

func CreateWeather(c echo.Context) error {
	lock.Lock()
	defer lock.Unlock()

	weather := Weather{}
	if err := c.Bind(weather); err != nil {
		return err
	}

	db.Create(&weather)

	return c.JSON(http.StatusOK, weather)
}

func GetWeather(c echo.Context) error {
	lock.Lock()
	defer lock.Unlock()

	id, _ := strconv.Atoi(c.Param("id"))
	var weather Weather
	db.First(&weather, id)

	return c.JSON(http.StatusOK, weather)
}

func GetWeathers(c echo.Context) error {
	lock.Lock()
	defer lock.Unlock()

	var weathers []Weather
	_ = db.Find(&weathers)

	return c.JSON(http.StatusOK, weathers)
}

func UpdateWeather(c echo.Context) error {
	lock.Lock()
	defer lock.Unlock()

	newWeather := Weather{}
	if err := c.Bind(newWeather); err != nil {
		return err
	}

	id, _ := strconv.Atoi(c.Param("id"))
	var weather Weather
	db.First(&weather, id)
	db.Model(&weather).Updates(newWeather)

	return c.JSON(http.StatusOK, weather)
}

func DeleteWeather(c echo.Context) error {
	lock.Lock()
	defer lock.Unlock()

	id, _ := strconv.Atoi(c.Param("id"))
	var weather Weather
	db.Delete(&weather, id)

	return c.JSON(http.StatusOK, weather)
}
