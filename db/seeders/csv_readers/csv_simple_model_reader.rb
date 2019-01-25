#!/usr/bin/ruby

require 'smarter_csv'

# require all files in app/models and below:
Dir[File.join(Rails.root, 'app', 'models', '**', '*.rb')].each { |f| require f }

#--------------------------
#
# @class CSVSimpleModelReader
#
# @desc Responsibility: For a model class, can read a csv file and
#   populate instances with it. The instances are _not_ saved to the database.
#   That is the responsibility of some other class in
#   case some other validation or information is needed.
#
#   This does not do any particular handling of any associations between
#   classes. It just slams whatever is in the Hash for each row into a
#   new instance
#
# @usage CSVSimpleModelReader.read_from_csv_file(Author, './db/seeders/csv_readers/authors-190124.csv')

#
# @author Ashley Engelund (ashley.engelund@gmail.com  weedySeaDragon @ github)
# @date   2019-01-24
#
# @file csv_simple_model_reader.rb
#
#--------------------------


class CSVSimpleModelReader

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
