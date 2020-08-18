FROM ruby:2.6.6-alpine

RUN apk add --no-cache --update bash \
    build-base \
    linux-headers \
    git \
    postgresql-dev \
    nodejs \
    yarn \
    tzdata && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

RUN gem install bundler

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . .
