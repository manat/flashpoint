FROM ruby:2.3.1-alpine  

# Update information about packages
RUN apk update

# Install bash in case you want to provide some work inside containe
# For example:
#     docker run -i -t name_of_your_image bash
RUN apk add bash

# g++ and make for gems building
RUN apk add g++ make

# Timezone data - required by Rails
RUN apk add tzdata

# Sqlite developer library
RUN apk add postgresql-dev

# Javscript runtime
RUN apk add nodejs

# Install bundler
RUN gem install bundler --no-ri --no-rdoc 

# Install all gems and cache them
ADD ./Gemfile /tmp
ADD ./Gemfile.lock /tmp

WORKDIR /tmp
RUN bundle install --without development test

# Copy application to image and set work dir
ADD . /usr/src/app
WORKDIR /usr/src/app
ENV RACK_ENV production  
# EXPOSE 3000
CMD bundle exec rails s -b 0.0.0.0

