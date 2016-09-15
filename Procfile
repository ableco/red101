web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -q default -q mailers
release: bundle exec rails db:migrate
