#!/usr/bin/ruby

require 'smarter_csv'


#--------------------------
#
# @class CSVBooksOrdersReader
#
# @desc Responsibility: Read in the books and orders CSV file and
#       return an array of Hashes (1 for each row)
#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-24
#
# @file csv_books_orders_reader.rb
#
#--------------------------


class CSVBooksOrdersReader

  DEFAULT_CSV_EXT = 'csv'.freeze


  def self.read_from_csv_file(klass, csv_filename = default_csv_filename)

    csv_data = []

    File.open(File.absolute_path(csv_filename), "r:bom|utf-8") do |csv_file|
      csv_data = SmarterCSV.process(csv_file) unless File.empty?(csv_file)
    end

    create_instances(klass, csv_data)
  end


  def self.create_instances(klass, csv_data)
    instances = []
    csv_data.each { |csv_row_hash| instances << klass.new(csv_row_hash) }
    instances
  end


  def self.default_csv_filename
    File.join(__dir__, "csv_file.#{DEFAULT_CSV_EXT}")
  end

end
