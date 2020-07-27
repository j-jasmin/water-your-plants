FROM ruby:2.6.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    apt-get update -qq && apt-get install -y build-essential nodejs yarn postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler \
    bundle install

COPY . .

RUN yarn install --check-files

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]

RUN RAILS_ENV=production bundle exec rake assets:precompile
