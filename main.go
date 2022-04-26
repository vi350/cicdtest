package main

import (
	"github.com/gin-gonic/autotls"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	domain := os.Getenv("DOMAIN")

	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "ci cd with docker",
		})
	})
	log.Fatal(autotls.Run(r, domain))
	//err = r.Run(":8080")
	//if err != nil {
	//	log.Fatal()
	//}
}
