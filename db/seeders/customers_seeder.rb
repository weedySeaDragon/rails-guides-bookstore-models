#!/usr/bin/ruby

require_relative './seeder'

#--------------------------
#
# @class  CustomersSeeder
#
# @desc Responsibility: seed records for Customers
#
# See:
#
# https://www.biography.com/news/black-female-scientists-black-history
# https://500womenscientists.org/request-a-scientist
# http://invention.si.edu/tags/women-inventors
# https://en.wikipedia.org/wiki/List_of_African-American_women_in_STEM_fields
#
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-12
#
# @file customers_seeder.rb
#
#--------------------------

class CustomersSeeder


  def self.seed

    find_or_make('Bernice', 'Sandler', title: 'Dr.')
    find_or_make('Willie', 'Hobbs Moore', title: 'Dr.')
    find_or_make('Ashley', 'Engelund')
    find_or_make('Susan', 'Kare')
    find_or_make('Kimberly', 'Bryant')
    find_or_make('Sylvia', 'Trimble Bozeman', title: 'Dr.')
    find_or_make('Katherine', 'Johnson')
    find_or_make('Patricia', 'Cowings', title: 'Dr.')
    find_or_make('Angie', 'Turner King', title: 'Dr.')
    find_or_make('Ryan', 'Bigg')
    find_or_make('Latany', 'Sweeney', title: 'Dr.')
    find_or_make('Lisette', 'Titre-Montgomery')
    find_or_make('Jane', 'Wright', title: 'Dr.')
    find_or_make('Carolyn', 'Parker', title: 'Dr.')

  end


  private_class_method def self.find_or_make(first_name, last_name, title: '')
                         Customer.find_or_create_by(first_name: first_name,
                                                    last_name:  last_name,
                                                    title:      title,
                                                    email:      "#{first_name.underscore}_#{last_name.underscore}@example.com")
                       end
end

