namespace :goodfornothing do
  desc 'Wipe database and start with fresh migration from legacy systems.'
  task :install => :environment do
    # backup db
    # db:seed
    # migrate:bookmarks
    # migrate:ning
    # migrate:wordpress
  end
end