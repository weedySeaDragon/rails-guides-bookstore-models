#!/usr/bin/ruby

require_relative './seeder'

#--------------------------
#
# @class  ReviewsSeeder
#
# @desc Responsibility: seed records for Reviews
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-12
#
# @file reviews_seeder.rb
#
#--------------------------

class ReviewsSeeder

  extend Seeder


  def self.create_seed_with(info, _index)

    Review.create(title:    Faker::Hipster.sentence,
                  body:     Faker::Hipster.paragraph,
                  book:     info[:books].sample,
                  customer: info[:customers].sample,
                  rating:   Random.rand(1..5),
                  state:    Random.rand(0..(Review.states.count - 1))
    )
  end

end

