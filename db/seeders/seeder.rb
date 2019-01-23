#!/usr/bin/ruby

#--------------------------
#
# @module Seeder
#
# @desc Responsibility: Be able to seed a given number of objects, with or without additional information.
#        Can create a single seed or a number of objects (seeds).
#        Can pass in a Hash with information required for creating an object (seed)
#
#        Classes only need to implement their own method :create_seed_with(assoc_info = {}, index: 0)
#        to create and save an object.
#
#         Ex:  To create a Customer
#               assume that the locale info is given in the
#               associated_info Hash: assocs[:locale] = the locale for the Customer
#               and that the first name ends with the current index (the current Customer number being seeded)
#
#                 class Customer
#
#                   extend Seeder
#
#                   DEFAULT_NUM = 20
#
#                   def self.create_seeds( associated_info, index )
#
#                    new_customer = Customer.create( first_name: "Firstname-#{index}",
#                                            last_name: 'Lastname',
#                                            locale: associated_info.fetch(:locale, I18n.default_locale),
#                                             # whatever else you need to do to create a Customer object
#                                )
#                     new_customer
#                   end
#                 end
#
#
#         Then  you can create Customers by calling any one of these versions:
#
#           Customer.seed
#           Customer.seed(42)
#           Customer.seed(84, {locale: :sv})
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-04
#
# @file seeder.rb
#
#--------------------------


module Seeder

  DEFAULT_NUM  = 5
  DEFAULT_INFO = {}


  # Seed instances of the class.
  # Can be called with 0..n arguments:
  #
  # with 0 arguments:  seeds DEFAULT_NUM instances
  #
  # with 1 argument:   seeds <arg[0]> instances
  #    ex:  seed( 3 )   # seeds 3 instances
  #
  # with 2 arguments:  seeds <arg[0]> instances and passes the Hash <arg[1]>
  #         to the create_seed_with  method each time
  #    ex: seed ( 3, {this: 'that'}) # seeds 3 instances and passes the Hash {this: 'that'} to
  #
  # with 3 or more arguments:
  #
  def seed(*args)

    case args.size
    when 0
      seed_num(DEFAULT_NUM, DEFAULT_INFO)
    when 1
      seed_num(args[0], DEFAULT_INFO)
    when 2
      seed_num(args[0], args[1])
    else
      seed_num(args[0], args.drop(1)) # pass the first arg as the num, the rest of the args as an array
    end
  end


  # Creates a number of instances (seeds) by simply calling create_seed :num times.
  #
  # @param num [Integer] - the number of instances to create. Defaults to DEFAULT_NUM
  # @param assoc_info [Hash] - any information needed to create the instances
  #
  def seed_num(num = DEFAULT_NUM, assoc_info = {})
    num.times { |n| create_seed(assoc_info, seed_num: n) }
  end


  # Call the method to create one individual instance (seed) after checking that the
  # arguments passed are as expected
  #
  # @param assoc_info [Hash] - any associated information needed to create an instance
  # @param seed_num [Integer] - the current number of the seed; can be useful when a
  #                          number of seeds are created for a class.
  #
  def create_seed(assoc_info = {}, seed_num: 0)
    unless assoc_info.class == Hash
      raise ArgumentError, "#{__method__} expects the argument to be a Hash"
    end

    create_seed_with(assoc_info, seed_num: seed_num)
  end


  # Creates an instance (a.k.a. 'seed')
  #
  # Each class must implement this to create a new instance
  #
  # @param _associated_info [Hash] - associated information needed to create an objecct
  # @param _seed_num [Integer] - the seed number of this particular instance, in a list of instances
  #                           Ex: this is the <seed_number>-th instance created out of 10 that will be created.
  #                           This might be used in creating fake (or real) seed information
  #
  # @return [Object] -  the object created
  def create_seed_with(_associated_info = {}, _seed_num: 0)
    raise NoMethodError, "#{__method__} must be implemented. It should create 1 object (seed)."
  end

end

