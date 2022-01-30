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
	docker tag chaspy/lambda-api-gateway 655123516369.dkr.ecr.region.amazonaws.com/lambda-api-gateway:latest

.PHONY: login
login:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin https://655123516369.dkr.ecr.ap-northeast-1.amazonaws.com
