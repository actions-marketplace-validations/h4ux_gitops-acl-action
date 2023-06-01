FROM golang:1.20-alpine3.18 AS build

RUN go install tailscale.com/cmd/gitops-pusher@gitops

FROM alpine:3.18

COPY --from=build /go/bin/gitops-pusher /usr/local/bin/gitops-pusher
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
