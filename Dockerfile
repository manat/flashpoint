FROM ruby:2.3.1-alpine  
ADD Gemfile /app/  
ADD Gemfile.lock /app/  
RUN apk --update add postgresql-dev tzdata nodejs
RUN apk add --virtual build-dependencies ruby-dev build-base && \  
    gem install bundler --no-ri --no-rdoc 
RUN cd /app ; bundle install --without development test
RUN apk del build-dependencies
ADD . /app  
RUN chown -R nobody:nogroup /app  
USER nobody  
ENV RACK_ENV production  
EXPOSE 3000  
WORKDIR /app  
