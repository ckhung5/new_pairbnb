worker: bundle exec sidekiq -C config/sidekiq.yml
web: bundle exec rails server

web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
 
