FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /digital_bank
COPY Gemfile /digital_bank/Gemfile
COPY Gemfile.lock /digital_bank/Gemfile.lock
RUN bundle install
COPY . /digital_bank


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
