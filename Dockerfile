FROM nginx:alpine

MAINTAINER Mahmoud Zalt <bigrocs@qq.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

# Set upstream conf and remove the default conf

CMD ["nginx"]

EXPOSE 80 443
