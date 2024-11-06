FROM golang:alpine AS builder

WORKDIR /build

RUN apk add git

RUN git clone https://github.com/wikiZ/RedGuard.git .

RUN go build -ldflags "-s -w" -trimpath

FROM alpine

WORKDIR /app

COPY --from=builder /build/RedGuard /app/RedGuard

RUN ./RedGuard

ENTRYPOINT ["./RedGuard"]