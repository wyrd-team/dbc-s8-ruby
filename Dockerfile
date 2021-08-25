FROM ruby:2.7.4

WORKDIR /app_root

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

COPY ./Gemfile $APP_ROOT
COPY ./Gemfile.lock $APP_ROOT
RUN bundle install

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0" ]
