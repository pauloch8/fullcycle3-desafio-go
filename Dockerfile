FROM golang:1.19rc1-alpine3.16 AS build
WORKDIR /go/src
COPY ./src .
RUN go build -o /go/bin

FROM scratch
WORKDIR /go/bin
COPY --from=build /go/bin .
CMD [ "./hello" ]
