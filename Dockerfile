FROM node:lts-alpine

RUN apk add --no-cache git  curl\
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

RUN apk add --no-cache \
    libstdc++ \
    chromium \
    harfbuzz \
    nss \
    freetype \
    ttf-freefont \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk


RUN addgroup -S emundo && adduser -S -g emundo emundo \
    && mkdir -p /home/emundo \
    && chown -R emundo:emundo /home/emundo 

USER emundo
WORKDIR /home/emundo

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/
