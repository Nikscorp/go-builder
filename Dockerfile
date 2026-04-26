FROM golang:1.26.2-alpine
LABEL maintainer="Nikscorp <voynov@nikscorp.com>"

ENV \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN apk add git
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin -d v2.11.4
RUN golangci-lint --version

RUN go install golang.org/x/perf/cmd/benchstat@latest
