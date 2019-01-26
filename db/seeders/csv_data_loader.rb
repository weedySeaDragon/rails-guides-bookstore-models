#!/usr/bin/ruby

require_relative File.join(__dir__, 'csv_readers', 'csv_simple_model_reader')


#--------------------------
#
# @class CSVDataLoader
#
# @desc Responsibility: Load all data from CSV files. This does NO ERROR CHECKING. Whee!
#
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-24
#
# @file csv_data_loader.rb
#
#--------------------------


class CSVDataLoader

  # data file names and location
  CSV_DATA_DIR = File.join(__dir__, 'csv_readers', 'csv_data')

  AUTHORS_CSV      = 'authors-190124.csv'.freeze
  BOOKS_CSV        = 'books-190124.csv'.freeze
  CUSTOMERS_CSV    = 'customers-190124.csv'.freeze
  ORDERS_CSV       = 'orders-190124.csv'.freeze
  REVIEWS_CSV      = 'reviews-190124.csv'.freeze
  SUPPLIERS_CSV    = 'suppliers-190124.csv'.freeze
  BOOKS_ORDERS_CSV = 'books_orders-190124.csv'.freeze


  # For each Class, we have a CSV data source
  # Once data is read in for a Class, we'll store it in :instances
  MODELS = [{ klass: Author, csv_data: AUTHORS_CSV, instances: [] },
            { klass: Book, csv_data: BOOKS_CSV, instances: [] },
            { klass: Customer, csv_data: CUSTOMERS_CSV, instances: [] },
            { klass: Order, csv_data: ORDERS_CSV, instances: [] },
            { klass: Review, csv_data: REVIEWS_CSV, instances: [] },
            { klass: Supplier, csv_data: SUPPLIERS_CSV, instances: [] },
  ]


  def self.load_csv_data

    delete_all_existing_data
    read_csv_into_instances
    save_everything
    connect_orders_and_books

    MODELS
  end


  def self.delete_all_existing_data

    # Have to delete things in particular sequence because of associations
    # (SQL foreign key constraints)
    #
    Review.delete_all

    # this removes associations so the remaining models can use .delete_all
    Order.destroy_all

    Customer.delete_all
    Book.delete_all
    Author.delete_all
    Supplier.delete_all
  end


  def self.read_csv_into_instances
    MODELS.each do |model_info|
      model_info[:instances] = CSVSimpleModelReader
          .read_from_csv_file(model_info[:klass],
                              csv_filename(model_info[:csv_data]))
    end
  end


  def self.connect_orders_and_books

    orders_and_books = read_orders_and_books

    orders_and_books.each do |book_for_order|
      order = Order.find(book_for_order[:order_id])
      book  = Book.find(book_for_order[:book_id])
      order.books << book
    end

  end


  def self.read_orders_and_books

    csv_data = []
    File.open(File.absolute_path(csv_filename(BOOKS_ORDERS_CSV)), "r:bom|utf-8") do |csv_file|
      csv_data = SmarterCSV.process(csv_file) unless File.empty?(csv_file)
    end
    csv_data
  end


  def self.save_everything

    # have to do this in order
    save_all(instances_for(Supplier))
    save_all(instances_for(Customer))
    save_all(instances_for(Author))
    save_all(instances_for(Book))
    save_all(instances_for(Review))
    save_all(instances_for(Order))

  end


  def self.instances_for(klass)
    MODELS.select { |model_info| model_info[:klass] == klass }.first[:instances]
  end


  def self.save_all(instances)
    instances.each(&:save)
  end


  def self.csv_filename(basename)
    File.join(CSV_DATA_DIR, basename)
  end

end

