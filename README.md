_Note: This is a Work In Progress.  What is here is a rough draft and may change._


# Example models, database, and seeds for the Active Record Query Inteface Rails Guide
https://guides.rubyonrails.org/active_record_querying.html

This repo has the "bookstore" models that are used in the examples for the guide.  You can use these to run and examine the examples in the guide.
 
This has methods for seeding the models with sample data

_TODO: Should scaffold all of the models.  It will be confusing to novices if only some of the typical Rails code (the models) exists._

![diagram of all of the Bookstore models](RailsGuide_AR_Querying_bookstore_models.png)


## Dependencies
- mysql
- See the `Gemfile` for the version of ruby and Rails


## To use:

1. Clone or fork this repo
   
1. Ensure your database is configured: check `config/database.yml` to ensure the settings are right for your system.  
   (This uses SqlList3.  If you want to use a different database, be sure to update the gem in the `Gemfile` and update the database settings.)
   https://guides.rubyonrails.org/getting_started.html
   
2. Create the database with `bin/rails db:create`
   
2. Run the migrations to create the tables in the database: `bin/rails db:migrate`
   https://guides.rubyonrails.org/active_record_migrations.html
    
3. Create sample data with `bin/rails db:seed`

### Reseed with new sample data
If you want to re-seed with new sample data, you can use the task `ae:railsguides:reseed_models`.  Note that this will _destroy_ the data in the database.
  

## License

MIT license

_(TODO)_

