#!/usr/bin/ruby

require_relative './seeder'

#--------------------------
#
# @class  SuppliersSeeder
#
# @desc Responsibility: seed records for Suppliers
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-12
#
# @file suppliers_seeder.rb
#
#--------------------------

class SuppliersSeeder

  extend Seeder

  def self.create_seed_with(_info, _index)
    Supplier.create(name: Faker::Company.name)
  end

end

