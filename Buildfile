FROM golang:1.25-alpine as builder

WORKDIR /app 

COPY go.mod go.sum main.go /app 

RUN go build -o procpag .

FROM alpine 

WORKDIR /app 

COPY --from=builder /app/procpag /app
COPY docs/ /app/docs/

EXPOSE 8089 

ENTRYPOINT ["./procpag"]
