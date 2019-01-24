class Author < ApplicationRecord
  has_many :books, -> { order('year_published DESC') }

  include Person

end
