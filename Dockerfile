FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /micro-movies
WORKDIR /micro-movies

COPY Gemfile /micro-movies/Gemfile
COPY Gemfile.lock /micro-movies/Gemfile.lock

RUN bundle install

COPY . /micro-movies
