FROM jekyll/jekyll:4.2.2

WORKDIR /code

COPY Gemfile .
COPY Gemfile.lock .

RUN gem update --system
RUN bundle install

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]