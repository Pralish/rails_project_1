FROM ruby:2.6.5-alpine
RUN apk update \
    && apk add gcc git libc-dev make libpq postgresql-dev nodejs tzdata g++ yarn
RUN gem install bundler
RUN gem install rake
WORKDIR /opt/rail_project_1
COPY . .
RUN bundle install
RUN yarn

# RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD bundle exec rails s -p $PORT -b '0.0.0.0'