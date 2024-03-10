FROM golang:1.19 as builder
WORKDIR /app
RUN go mod init teste
COPY . .
RUN go build -o math

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./math"]