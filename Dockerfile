FROM ruby:2.6.5-alpine
RUN apk update \
    && apk add gcc git libc-dev make libpq postgresql-dev nodejs tzdata g++ yarn
RUN gem install bundler
WORKDIR /opt/rail_project_1
COPY . .
RUN bundle install
RUN yarn