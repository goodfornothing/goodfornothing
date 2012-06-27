namespace :goodfornothing do
  desc 'Wipe database and start with fresh migration from legacy systems.'
  task :install => :environment do
    
    # backup db
    Rake::Task['db:reset'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    
    Rake::Task['migrate:bookmarks'].invoke
    Rake::Task['migrate:wordpress'].invoke
    
  end
end