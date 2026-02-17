FROM golang:1.25

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o tracker-app

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/tracker-app .

EXPOSE 8080

CMD ["./tracker-app"]