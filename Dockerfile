FROM alpine:3.10
RUN apk add --no-cache --upgrade bash && apk add --no-cache curl
COPY ci.sh /ci.sh
ENTRYPOINT ["/ci.sh"]