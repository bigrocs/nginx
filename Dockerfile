FROM nginx:alpine

MAINTAINER Mahmoud Zalt <bigrocs@qq.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream_52 { server ${PHP_SERVER}:${PHP_52_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_53 { server ${PHP_SERVER}:${PHP_53_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_54 { server ${PHP_SERVER}:${PHP_54_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_55 { server ${PHP_SERVER}:${PHP_55_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_56 { server ${PHP_SERVER}:${PHP_56_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_70 { server ${PHP_SERVER}:${PHP_70_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && echo "upstream php-upstream_71 { server ${PHP_SERVER}:${PHP_71_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
