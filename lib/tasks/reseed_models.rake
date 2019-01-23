namespace :ae do
  namespace :railsguides do

    desc "Reseed the model tables only"
    task :reseed_models => [:environment] do

      # First delete all of the data:
      #  - order is important due to referential integrity (relationships)

      Book.all.each { |book| book.orders.delete_all }

      models = [Review, Order, Book, Author, Customer, Supplier]
      models.each(&:delete_all)

      begin
        Rake::Task["db:seed"].invoke

      rescue => error
        puts "Uh oh.  There was a problem (re)seeding the database."
        puts error
        raise error
      end

    end

  end

end
