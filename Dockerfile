FROM node:16-bullseye-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    locales \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP

ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /app && chown -R node:node /app
WORKDIR /app
USER node
