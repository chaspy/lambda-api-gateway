.PHONY: build
build:
	GOOS=linux GOARCH=amd64 go build -o hello

.PHONY: archive
archive:
	zip hello.zip hello 

.PHOYN: upload
upload:
	aws lambda update-function-code --function-name hello-api-gateway --zip-file fileb://hello.zip

.PHONY: docker
docker:
	docker build . -t chaspy/lambda-api-gateway:latest
	docker tag chaspy/lambda-api-gateway:latest 655123516369.dkr.ecr.${AWS_REGION}.amazonaws.com/lambda-api-gateway:latest

.PHONY: login
login:
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin https://655123516369.dkr.ecr.${AWS_REGION}.amazonaws.com
