FROM ruby:2.3.1

RUN apt-get update \
  && apt-get install -y aptitude optipng pngquant jpegoptim ntp ufw htop nodejs git openssl build-essential python-software-properties

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

RUN mkdir -p log && \
    mkdir -p tmp/cache \
    mkdir -p tmp/pids \
    mkdir -p tmp/sessions \
    mkdir -p tmp/sockets