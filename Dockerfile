FROM golang:1.10-alpine AS build

RUN apk add --no-cache git

WORKDIR $GOPATH/src/github.com/betabandido/cloud-build-test
COPY . .

RUN go get -d -v
RUN go build -o /go/bin/hello

FROM alpine:3.7

EXPOSE 8000

COPY --from=build /go/bin/hello /go/bin/hello
ENTRYPOINT [ "/go/bin/hello" ]
