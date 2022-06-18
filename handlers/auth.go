package handlers

import (
    "database/sql"
	"net/http"
	"os"
	"time"
	"log"
	"strconv"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/vesnateamgithub/poolarko/models"
	"github.com/vesnateamgithub/poolarko/helpers"
    "golang.org/x/crypto/bcrypt"
    "gopkg.in/go-playground/validator.v9"
)

type AuthHandler struct {
	db *sql.DB
}

type Claims struct {
	Username string `json:"username"`
	jwt.StandardClaims
}

type JWTOutput struct {
	Token   string    `json:"token"`
	Expires time.Time `json:"expires"`
}

var validate *validator.Validate

func init() {
    validate = validator.New()
}

func NewAuthHandler(db *sql.DB) *AuthHandler {
	return &AuthHandler{
		db: db,
	}
}

func (handler *AuthHandler) RegisterHandler(c *gin.Context) {
	// check message format
    var user models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, err.Error())
		return
	}

    // validate data
    if err := validate.Struct(user); err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, err.Error())
        return
    }

    pwd := []byte(user.Password)
    hash, err := bcrypt.GenerateFromPassword(pwd, bcrypt.MinCost)
    if err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, err.Error())
    }
    hashPwd := string(hash);

    // update database
    _, err = handler.db.Exec("INSERT INTO users (email, name, password) VALUES (?, ?, ?)", user.Email, user.Name, hashPwd)
    if err != nil {
		helpers.RespondWithError(c, http.StatusUnprocessableEntity, "Error creating user.")
        return
    }

	helpers.RespondWithSuccess(c, http.StatusOK, "User created.")
}

func (handler *AuthHandler) SignInHandler(c *gin.Context) {
	// check message format
	var user models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, err.Error())
		return
	}

    // find the user pwd in the database
    var hashPwd string
    row := handler.db.QueryRow("SELECT password FROM users WHERE email = ?", user.Email)
    if err := row.Scan(&hashPwd); err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, "Invalid email or password.")
		return
    }

    byteHash := []byte(hashPwd)
    pwd := []byte(user.Password)
    if err := bcrypt.CompareHashAndPassword(byteHash, pwd); err != nil {
		helpers.RespondWithError(c, http.StatusBadRequest, "Invalid email or password.")
		return
    }

    expMinutes, err := strconv.ParseInt(os.Getenv("JWT_EXPIRATION"), 10, 64)
    if err != nil {
        log.Println("SignInHandler: Incorrect JWT_EXPIRATION, default will be used")
        expMinutes = 10
    }

    expirationTime := time.Now().Add(time.Duration(expMinutes) * time.Minute)
	claims := &Claims{
		Username: user.Email,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
		},
	}

    log.Printf("SignInHandler3:\n")

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	jwtOutput := JWTOutput{
		Token:   tokenString,
		Expires: expirationTime,
	}
	c.JSON(http.StatusOK, jwtOutput)
}

//func (handler *AuthHandler) AuthMiddleware() gin.HandlerFunc {
//	return func(c *gin.Context) {
//		tokenValue := c.GetHeader("Authorization")
//		claims := &Claims{}
//
//		tkn, err := jwt.ParseWithClaims(tokenValue, claims, func(token *jwt.Token) (interface{}, error) {
//			return []byte(os.Getenv("JWT_SECRET")), nil
//		})
//		if err != nil {
//			c.AbortWithStatus(http.StatusUnauthorized)
//		}
//		if !tkn.Valid {
//			c.AbortWithStatus(http.StatusUnauthorized)
//		}
//		c.Next()
//	}
//}
//
