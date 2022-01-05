.PHONY: build
build:
	GOOS=linux GOARCH=amd64 go build -o hello

.PHONY: archive
archive:
	zip hello.zip hello 

.PHOYN: upload
upload:
	aws lambda update-function-code --function-name hello-api-gateway --zip-file fileb://hello.zip
