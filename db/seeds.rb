# require all files in ./seeders and below:
Dir[File.join(__dir__, 'seeders', '**', '*.rb')].each { |f| require f }

require_relative File.join(__dir__,'seeders', 'csv_data_loader')

CSVDataLoader.load_csv_data
