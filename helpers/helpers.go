package helpers

import (
	"github.com/gin-gonic/gin"
)

func RespondWithError(c *gin.Context, status int, errors string) {
    c.JSON(status, gin.H{
        "status": status,
        "errors": errors,
    })
}

func RespondWithSuccess(c *gin.Context, status int, message string) {
    c.JSON(status, gin.H{
        "status": status,
        "message": message,
    })
}

