class Author < ApplicationRecord
  has_many :books, -> { order('year_published DESC') }, dependent: :destroy

  include Person

end
