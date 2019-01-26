# Bookstore Models and Data
 
### for the [Active Record Query Inteface Rails Guide](https://guides.rubyonrails.org/active_record_querying.html)

_These models are actually for [a PR submitted for the guide so that just one set of models is used for all examples.](https://github.com/rails/rails/pull/35008)  If the PR is accepted, then these will match up with what the guide says._

I created this to help people run and understand the examples in the Rails
  Guide. I want to save people --
           especially <em>novices</em> who are coming up many learning curves at once -- the time and effort
           needed to figure out exactly how to define and scaffold the models used in the
           examples.

**The goal is to present the models with just enough data so the examples can be
  run and explored.**

_This is a first draft.  The data does not yet match the example results in the guide exactly._

This is <em>not</em> a complete or efficient Rails application.
 
The models are defined like they are _as examples_ to illustrate code and concepts from the guide. They would not necessarily use the same definitions and methods in a real world Rails application. Only very minimal layout (view) work was done.

Read more about the details and intention on [the home page when you run this as a Rails app.](app/views/home/index.html.erb)  (This is a Rails `.html.erb` file.  It will fully readable when you run this as a Rails application.)


## Dependencies
- **Rails 5.2.2**

   This may run just fine under earlier 5.x versions of Rails.  I have not tested it.  I made this to work with the examples in [the guide for Rails 5.2.2.](https://guides.rubyonrails.org/active_record_querying.html)
   
- **Sqlite3**  
   The `Gemfile` and `config/db` are set up to use this, but you can use whatever db you want. There's no code that is db specific.  Feel free to change the Gemfile and use the db of your choice)

- **Ruby 2.5.1**


## Installation and Use:

1. Clone or fork this repo
   
1. Ensure your database is configured: check `config/database.yml` to ensure the settings are right for your system.  
   (This uses SqlLite3.  If you want to use a different database, be sure to update the gem in the `Gemfile` and update the database settings.)
   [Read more about setting up your database in the Getting Started Rails Guide](https://guides.rubyonrails.org/getting_started.html)
   
2. `bin/rails db:setup` creates the database, runs the migrations, and seeds it with the example data. 
   
2. Use the `rails console` to run the examples from the guide.
   
3. Run it as a local web application with `rails server` to see the data in web page views.  
  

## Bookstore models
![diagram of all of the Bookstore models](app/assets/images/RailsGuide_AR_Querying_bookstore_models.png)



## Feedback
Is this helpful? How could it be made _more_ helpful? Please post comments and suggestions to the [Github repo issues queue.](https://github.com/weedySeaDragon/rails-guides-bookstore-models)
   


## MIT License

The authors and contributors have agreed to license all other software under the MIT license, an open source free software license. See the file named [LICENSE](LICENSE) which includes a disclaimer of warranty.

