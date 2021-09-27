FROM ruby:2.7.4

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      vim && \
    apt-get clean -y

RUN gem install bundler solargraph ruby-debug-ide

WORKDIR /app_root
COPY . .
RUN bundle install --jobs=$(nproc)

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
