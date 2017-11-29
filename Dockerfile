FROM nginx:alpine

MAINTAINER Mahmoud Zalt <bigrocs@qq.com>

ARG PHP_52_PORT=9052
ENV PHP_52_PORT ${PHP_52_PORT}
ARG PHP_53_PORT=9053
ENV PHP_53_PORT ${PHP_53_PORT}
ARG PHP_54_PORT=9054
ENV PHP_54_PORT ${PHP_54_PORT}
ARG PHP_55_PORT=9055
ENV PHP_55_PORT ${PHP_55_PORT}
ARG PHP_56_PORT=9056
ENV PHP_56_PORT ${PHP_56_PORT}
ARG PHP_70_PORT=9070
ENV PHP_70_PORT ${PHP_70_PORT}
ARG PHP_71_PORT=9071
ENV PHP_71_PORT ${PHP_71_PORT}

ARG PHP_SERVER=127.0.0.2
ENV PHP_SERVER ${PHP_SERVER}

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
