FROM golang:1.21.0-alpine
LABEL maintainer="Nikscorp <voynov@nikscorp.com>"

ENV \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN apk add git
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin -d v1.54.1
RUN golangci-lint --version

RUN go install golang.org/x/perf/cmd/benchstat@latest
