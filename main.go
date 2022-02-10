package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

func hello() (string, error) {
	return "Hello PipeCD v1", nil
}

func main() {
	// Make the handler available for Remote Procedure Call by AWS Lambda
	lambda.Start(hello)
}
