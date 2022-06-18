// Poolarko
//
package main

import (
    "database/sql"
    "fmt"
	"log"
	"os"

	"github.com/gin-gonic/gin"
    "gopkg.in/natefinch/lumberjack.v2"
    "github.com/joho/godotenv"
    "github.com/go-sql-driver/mysql"
	handlers "github.com/vesnateamgithub/poolarko/handlers"
)

var db *sql.DB
var authHandler *handlers.AuthHandler

func init() {
    // init log
    log.SetOutput(&lumberjack.Logger{
		Filename:   "./log/poolarko.log",
		MaxSize:    500, // megabytes
		MaxBackups: 3,
		MaxAge:     28,   // days
		Compress:   true, // disabled by default
	})

    // load environment
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading environment file.")
    }

    // Capture connection properties.
    cfg := mysql.Config{
        User:   os.Getenv("DB_USERNAME"),
        Passwd: os.Getenv("DB_PASSWORD"),
        Net:    "tcp",
        Addr:   fmt.Sprintf("%s:%s",os.Getenv("DB_HOST"), os.Getenv("DB_PORT")),
        DBName: os.Getenv("DB_NAME"),
        AllowNativePasswords: true,
    }
    // Get a database handle.
    db, err = sql.Open("mysql", cfg.FormatDSN())
    if err != nil {
        log.Fatal(err)
    }

    pingErr := db.Ping()
    if pingErr != nil {
        log.Fatal(pingErr)
    }
    log.Println("Database Connected!")

    // handlers
	authHandler = handlers.NewAuthHandler(db)
}

func main() {
	router := gin.Default()

    router.POST("/register", authHandler.RegisterHandler)
    router.POST("/signin", authHandler.SignInHandler)

	router.Run()
}

