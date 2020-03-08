FROM alpine:latest
RUN apk update && apk add bind
RUN mkdir /root/zones
WORKDIR /root/zones
ENTRYPOINT ["named-checkzone"]
