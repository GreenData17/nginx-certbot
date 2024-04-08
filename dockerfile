FROM nginx

RUN apt update
RUN apt install -y certbot python3-certbot-nginx

EXPOSE 80
EXPOSE 443

RUN mkdir /etc/config

ENV CERTBOT_EMAIL=""
ENV CERTBOT_DOMAINS=""

ARG CERTBOT_FLAGS=""
ENV CERTBOT_DEBUG="FALSE"

RUN if [ "$CERTBOT_DEBUG" = "TRUE" ]; then CERTBOT_FLAGS="--test-cert"; else CERTBOT_DEBUG=""; fi

CMD cp /etc/config/* /etc/nginx/ && nginx -g "daemon off;" & certbot $CERTBOT_FLAGS --nginx --non-interactive --agree-tos -m $CERTBOT_EMAIL -d $CERTBOT_DOMAINS && nginx -s stop && nginx -g "daemon off;"
