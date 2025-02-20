FROM golang:1.21

RUN go install github.com/cespare/reflex@latest

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

COPY entrypoint.sh /app/

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]