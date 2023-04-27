package routes

import (
	"github.com/labstack/echo/v4"
	"myapp/controllers"
)

func InitWeatherRoutes(e *echo.Echo) {
	e.GET("/weather", controllers.GetWeathers)
	e.GET("/weather/:id", controllers.GetWeather)

	e.POST("/weather", controllers.CreateWeather)
	e.PUT("/weather/:id", controllers.UpdateWeather)
	e.DELETE("/weather/:id", controllers.DeleteWeather)
}
