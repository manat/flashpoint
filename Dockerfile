FROM ruby:2.3.3-alpine  

ADD Gemfile /app/  
ADD Gemfile.lock /app/ 
ENV BUNDLE_PATH /bundle

RUN apk update
RUN apk add bash
RUN apk add postgresql-dev tzdata nodejs
RUN apk add --virtual build-dependencies ruby-dev build-base 

RUN gem install bundler --no-ri --no-rdoc 
RUN cd /app ; bundle install --without development test
RUN apk del build-dependencies

ENV RACK_ENV production  

ADD . /app  
RUN chown -R nobody:nogroup /app  
USER nobody  

EXPOSE 3000  

WORKDIR /app  
RUN bundle exec rake assets:precompile
