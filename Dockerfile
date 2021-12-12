FROM --platform=linux/x86_64 node:14.15.4-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP

ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app

COPY package.json ./
RUN yarn install --ignore-optional && yarn cache clean
