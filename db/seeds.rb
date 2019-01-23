# require all files in ./seeders and below:
Dir[File.join(__dir__, 'seeders', '**', '*.rb')].each { |f| require f }


SuppliersSeeder.seed(12)
BooksSeeder.seed(40, { suppliers: Supplier.all })
CustomersSeeder.seed
OrdersSeeder.seed

ReviewsSeeder.seed(105, { customers: Customer.all, books: Book.all })

models = [Book, Customer, Order, Review, Supplier]
puts "\nDatabase is now seeded with:"
models.each do |model|
  puts " #{model.count.to_s.rjust(4)} #{model.name.pluralize}"
end
