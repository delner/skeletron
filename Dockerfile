FROM ruby:2.5
LABEL author="David Elner"
LABEL author_email="david@davidelner.com"

# Setup a working directory
WORKDIR /opt/skeletron

# Copy gem specifications
RUN gem install bundler -v '1.16.1'
COPY Gemfile* ./
COPY skeletron.gemspec .
COPY lib/skeletron/version.rb lib/skeletron/

# Install gems
RUN bundle install --system

# Add source code
COPY . /opt/skeletron
