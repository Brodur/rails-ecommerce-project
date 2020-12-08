FROM ruby:2.7

# Project Root
ENV RAILS_ROOT /project

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Add Yarn to sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  libpq-dev && \
  mkdir -p $RAILS_ROOT && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install

COPY . .

RUN bundle exec rails assets:precompile

# # Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]