json.extract! book, :id, :title, :year_published, :isbn, :out_of_print, :views, :price, :author_id, :supplier_id, :created_at, :updated_at
json.url book_url(book, format: :json)
