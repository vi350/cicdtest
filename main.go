package main

import (
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"log"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message":      "test",
			"someint":      673945,
			"boolean":      false,
			"testArray":    []int{1, 2, 3, 4, 5},
			"innerObjects": gin.H{"element": "value"},
		})
	})
	err = r.Run(":8080")
	if err != nil {
		log.Fatal()
	}
}
