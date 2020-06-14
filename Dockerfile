FROM golang:1.14-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /app

RUN go get -u -v gopkg.in/oauth2.v4/...

COPY . .

RUN go build server.go

EXPOSE 9096

CMD ["./server"]
