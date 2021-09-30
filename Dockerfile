# # syntax=docker/dockerfile:1

# #build stage
# FROM golang:1.15.5 AS builder
# # RUN apk add --no-cache git
# WORKDIR /go/src/app
# COPY . .
# RUN go get -d -v ./...
# RUN go build -o /go/bin/app -v ./...

# #final stage
# FROM 1.15.5:latest
# # RUN apk --no-cache add ca-certificates
# COPY --from=builder /go/bin/app /app
# ENTRYPOINT /app
# LABEL Name=gokube Version=0.0.1
# EXPOSE 8000

# FROM golang:1.15.5

# WORKDIR /app

# COPY go.mod ./
# COPY go.sum ./
# RUN go mod download

# COPY *.go ./

# RUN go build app.go


# EXPOSE 8000

FROM golang:1.15.5
ADD . /go/src/gokube
ADD . /usr/local/go/src/gokube
WORKDIR /go/src/gokube
RUN go get gokube
RUN go install
ENTRYPOINT ["/go/bin/gokube"]