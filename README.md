# README

## Setup

To build and run, run `docker compose up`. Once containers are up, run
the migrations and add the user with
`docker compose exec web bin/rails db:migrate db:seed`.

To run the tests first run
`docker compose run --rm -e RAILS_ENV=test web bundle exec rails db:test:prepare`
and after that one-off command run
`docker compose run --rm -e RAILS_ENV=test web bundle exec rspec`
