FROM golang:1.18.1-alpine3.15

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

EXPOSE 8080

CMD ["./app"]


#FROM golang:1.18.1 AS builder
#
#RUN mkdir /app
#ADD . /app
#WORKDIR /app
#
#RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...
#
#FROM alpine:latest AS production
#
#COPY --from=builder /app .
#
#CMD ["./main"]