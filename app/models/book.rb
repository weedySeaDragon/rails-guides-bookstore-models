class Book < ApplicationRecord

  belongs_to :supplier
  belongs_to :author

  has_many :reviews
  has_and_belongs_to_many :orders, join_table: 'books_orders'


  # default_scope { where('year_published >= ?', Date.current.year - 50 )}

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }

  scope :recent, -> { where('year_published >= ?', Date.current.year - 50) }
  scope :old, -> { where('year_published < ?', Date.current.year - 50) }

  scope :out_of_print_and_expensive, -> { out_of_print.where('price > 500') }

  scope :costs_more_than, ->(amount) { where('price > ?', amount) }

end
