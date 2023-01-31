FROM nginx:alpine

RUN apk add --update apache2-utils \
    && rm -rf /var/cache/apk/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf 
COPY nginx.sh /app/scripts/nginx.sh

RUN chmod +x /app/scripts/nginx.sh

# RUN addgroup -gid 1000 www && \
#     adduser -uid 1000 -H -D -s /bin/sh -G www www

CMD /app/scripts/nginx.sh