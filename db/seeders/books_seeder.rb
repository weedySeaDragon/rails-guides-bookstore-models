#!/usr/bin/ruby

require_relative './seeder'

require 'faker'

#--------------------------
#
# @class BooksSeeder
#
# @desc Responsibility: seed records for Books and their related Authors
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-12
#
# @file Books_seeder.rb
#
#
# TODO create remaining books number of with semi-random names
#--------------------------

class BooksSeeder


  # https://docs.aws.amazon.com/AWSECommerceService/latest/DG/EX_SearchingbyAuthor.html
  #
  def self.seed(_count, assoc)

    @suppliers = assoc[:suppliers]

    seed_barbara_liskov_books
    seed_martin_fowler_books
    seed_hedy_lamarr_books

    seed_other_books

    # Ada's Algorithm: How Lord Byron's Daughter Ada Lovelace Launched the Digital AgeOct 14, 2014
    # by James Essinger
    #
    # Ada, the Enchantress of Numbers: A Selection from the Letters of Lord Byron's Daughter and Her Description of the First ComputerJan 8, 1992
    # by Betty A. Toole
    #
    # authors << Author.create(first_name: 'Douglas ', last_name: 'Engelbart')
    # authors << Author.create(first_name: 'Srinivasa ', last_name: 'Ramanujan')

  end


  # ==========================================================================
  # private


  private_class_method def self.seed_barbara_liskov_books

                         books_for_author('Barbara', 'Liskov', 'Dr',
                                          [{ title:          'Highly-Available Distributed Services and Fault-Tolerant Distributed Garbage Collection',
                                             year_published: 1986 },
                                           { title:          'Abstraction and Specification in Program Development',
                                             year_published: 1986 },
                                           { title:          'The Design of the Venus Operating System',
                                             year_published: 1971,
                                             out_of_print:   true,
                                             price:          100 },
                                           { title:          'A New Definition of the Subtype Relation',
                                             year_published: 1993,
                                             price:          800.00,
                                             out_of_print:   true },
                                           { title:          'Programming with Abstract Data Types',
                                             year_published: 1974,
                                             out_of_print:   true }
                                          ]
                         )
                       end


  private_class_method def self.seed_martin_fowler_books
                         books_for_author('Martin', 'Fowler', 'Dr',
                                          [{ title:          'Refactoring: Improving the Design of Existing Code (2nd Edition) ',
                                             year_published: 2018 },
                                           { title:          'Patterns of Enterprise Application Architecture',
                                             year_published: 2002 },
                                           { title:          'Analysis Patterns: Reusable Object Models',
                                             year_published: 1986 },
                                          ])
                       end


  private_class_method def self.seed_hedy_lamarr_books

                         book_for_author({ title:          "Spread Spectrum: Hedy Lamarr and the mobile phone",
                                           year_published: 2006,
                                           price:          28.00 },
                                         'Rob', 'Walters')

                         book_for_author({ title:          "Beautiful Invention: A Novel of Hedy Lamarr",
                                           year_published: 2018,
                                           price:          22.22 },
                                         'Margaret', 'Porter')

                         book_for_author({ title:          "Hedy's Folly: The Life and Breakthrough Inventions of Hedy Lamarr, the Most Beautiful Woman in the World",
                                           year_published: 2011,
                                           price:          25.00 },
                                         'Richard', 'Rhodes')
                       end


  private_class_method def self.seed_other_books

                         book_for_author({ title:          "Clean Code: A Handbook of Agile Software Craftsmanship",
                                           year_published: 2008,
                                           price:          31.56 },
                                         'Robert', 'Martin')

                         book_for_author({ title:          "The Mythical Man-Month: Essays on Software Engineering",
                                           year_published: 1995,
                                           price:          24.95 },
                                         'Frederick', 'Brooks', 'Dr.')

                         book_for_author({ title:          "Domain-Driven Design: Tackling Complexity in the Heart of Software",
                                           year_published: 2003,
                                           price:          58.00 },
                                         'Eric', 'Evans')

                         book_for_author({ title:          "Agile Retrospectives: Making Good Teams Great",
                                           year_published: 2003,
                                           price:          21.54 },
                                         'Esther', 'Derby')

                         book_for_author({ title:          "Game Design Workshop: A Playcentric Approach to Creating Innovative Games",
                                           year_published: 2018,
                                           price:          66.00 },
                                         'Tracy', 'Fullerton')

                         book_for_author({ title:          "Peopleware: Productive Projects and Teams",
                                           year_published: 2013,
                                           price:          38.00 },
                                         'Tom', 'DeMarco')

                         book_for_author({ title:          "Extreme Programming Explained: Embrace Change",
                                           year_published: 2004,
                                           price:          43.00 },
                                         'Kent', 'Beck')
                       end


  private_class_method def self.books_for_author(author_firstname, author_lastname, author_title = '', info_for_books)

                         info_for_books.each do |book_info|
                           book_for_author(book_info,
                                           author_firstname,
                                           author_lastname,
                                           author_title)
                         end
                       end


  private_class_method def self.book_for_author(book_info, author_firstname, author_lastname, author_title = '')

                         author = Author.find_or_create_by(first_name: author_firstname, last_name: author_lastname, title: author_title)

                         Book.find_or_create_by(title: book_info[:title]) do |new_book|
                           new_book.year_published = book_info[:year_published]
                           new_book.price          = book_info.fetch(:price, 45.00)
                           new_book.out_of_print   = book_info.fetch(:out_of_print, false)
                           new_book.author         = author
                           new_book.supplier       = @suppliers.sample
                           new_book.views          = Random.rand(0..1000)
                         end
                       end

end

