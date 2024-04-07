FROM nginx

RUN apt update
RUN apt install -y certbot python3-certbot-nginx

EXPOSE 80
EXPOSE 443

RUN mkdir /etc/config

ENV CERTBOT_EMAIL=""
ENV CERTBOT_DOMAINS=""

CMD cp /etc/config/* /etc/nginx/ && nginx -g "daemon off;" & certbot --nginx --non-interactive --agree-tos -m $CERTBOT_EMAIL -d $CERTBOT_DOMAINS && nginx -s stop && nginx -g "daemon off;"
