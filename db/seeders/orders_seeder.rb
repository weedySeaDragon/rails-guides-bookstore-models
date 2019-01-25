#!/usr/bin/ruby

require_relative './seeder'

#--------------------------
#
# @class  OrdersSeeder
#
# @desc Responsibility: seed records for Orders
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-12
#
# @file orders_seeder.rb
#
#--------------------------

class OrdersSeeder

  TAX_RATE = 0.012


  def self.seed

    orders_for_ashley
    orders_for_dr_sandler

    other_customers = Customer.all - [Customer.find_by(last_name: 'Engelund'), Customer.find_by(last_name: 'Sandler')]
    (other_customers.size - 2).times do
      random_order_for(other_customers.sample)
    end
  end


  private_class_method def self.orders_for_ashley

                         ashley = Customer.find_by(last_name: 'Engelund')
                         if ashley
                           liskov       = Author.find_by(last_name: 'Liskov')
                           liskov_books = Book.where(author: liskov)
                           order_for(ashley, liskov_books, 12.00)

                           refactoring = Book.where("title LIKE 'Refactoring: Improving the Design of Existing Code%' ")
                           order_for(ashley, refactoring, 6.00)
                         end

                       end


  private_class_method def self.orders_for_dr_sandler

                         dr_sandler = Customer.find_by(last_name: 'Sandler')
                         if dr_sandler
                           spread_spectrum = Book.where(title: "Spread Spectrum: Hedy Lamarr and the mobile phone")
                           order_for(dr_sandler, spread_spectrum, 0)
                         end

                       end


  private_class_method def self.random_order_for(customer)

                         books = []

                         # pick 1 - 5 books
                         num_books = Random.rand(1..5)
                         num_books.times { books << Book.all.sample }

                         random_shipping = Random.rand(0..(num_books * 6.99)).round(2)

                         order_for(customer, books, random_shipping)
                       end


  private_class_method def self.order_for(customer, books, shipping)
                         subtotal = books.inject(0){|sum, book| sum + book.price }.round(2)
                         tax   = tax_for(subtotal)
                         total = total(subtotal, tax)

                         order       = Order.create(customer:       customer,
                                                    date_submitted: Time.now,
                                                    subtotal:       subtotal,
                                                    tax:            tax,
                                                    shipping:       shipping,
                                                    total:          total,
                                                    status:         Order.statuses.values.sample,
                         )
                         order.books = books
                         order.save

                       end


  private_class_method def self.tax_for(total_amount)
                         (total_amount * TAX_RATE).round(2)
                       end


  private_class_method def self.total(subtotal, shipping)
                         tax = tax_for(subtotal)
                         (subtotal + shipping + tax).round(2)
                       end


end

