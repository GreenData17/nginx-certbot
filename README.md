# nginx-certbot
<div align="left">

  <a href="">[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)</a>
  <a href="">![Docker Automated build](https://img.shields.io/docker/automated/greendata017/nginx-certbot)</a>
  <a href="">![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/GreenData17/nginx-certbot/docker-build.yaml)</a>
  <a href="">![Docker Pulls](https://img.shields.io/docker/pulls/greendata017/nginx-certbot)</a>

</div>

A simple docker image which requests an SSL certificate via certbot / Letsencrypt.


## Usage

Pull this repository and use it with a docker-compose file like this:
```yaml
services:
    {SERVICE_NAME}:
        build: .
        ports:
            - 80:80
            - 443:443
        volumes:
            - {PATH_TO_HTML_FILES}:/usr/share/nginx/html
            - {PATH_TO_CONFIG_FILES}:/etc/config
        environment:
            - CERTBOT_EMAIL={YOUR_EMAIL}
            - CERTBOT_DOMAINS={YOUR_DOMAIN}
```

Or pull it directly form the docker repository and use it with a docker-compose file like this:
```yaml
services:
    {SERVICE_NAME}:
        image: greendata017/nginx-certbot:latest
        ports:
            - 80:80
            - 443:443
        volumes:
            - {PATH_TO_HTML_FILES}:/usr/share/nginx/html
            - {PATH_TO_CONFIG_FILES}:/etc/config
        environment:
            - CERTBOT_EMAIL={YOUR_EMAIL}
            - CERTBOT_DOMAINS={YOUR_DOMAIN}
```

## Example
```yaml
services:
    webserver:
        build: .
        container_name: webserver-with-ssl
        ports:
            - 80:80
            - 443:443
        volumes:
            - ./my-website:/usr/share/nginx/html
            - ./configs:/etc/config
        environment:
            - CERTBOT_EMAIL=mail@example.com
            - CERTBOT_DOMAINS=example.com,www.example.com
```

## Test

If you need to restart the image a lot, you might get locked out for requesting a certificate to many times. <br/>
Use this variable to get a temporary certificate, so you can test the image.
```yaml
environment:
    - CERTBOT_DEBUG="TRUE"
```
