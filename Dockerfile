FROM golang:1.18.1-alpine3.15

RUN mkdir /app
WORKDIR /app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -buildvcs=false -o ./appbinary ./...

EXPOSE 8080

CMD ["./appbinary"]


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