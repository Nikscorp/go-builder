FROM golang:1.27.0-alpine
LABEL maintainer="Nikscorp <voynov@nikscorp.com>"

ENV \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN apk add git
RUN go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.12.2
RUN golangci-lint --version

RUN go install golang.org/x/perf/cmd/benchstat@latest
