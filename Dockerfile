# Building site from source
FROM ubuntu:20.04 as build
ARG GITHUB_USER
ARG GITHUB_TOKEN
ARG GITHUB_REPOSITORY
ARG HUGO_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends wget git ca-certificates

WORKDIR /tmp/
RUN wget --no-check-certificate https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
 && tar zxf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
 && mv hugo /usr/local/bin 

WORKDIR /tmp/src
RUN git clone --recursive https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY} .

RUN hugo

# Create Nginx container
FROM nginx:stable-alpine

ENV SITE_URL=example.com

COPY templates/* /etc/nginx/conf.d

COPY --from=build /tmp/src/public /usr/share/nginx/html