FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3 libsqlite3-dev memcached
RUN mkdir /myapp
RUN gem install rails
WORKDIR /myapp
