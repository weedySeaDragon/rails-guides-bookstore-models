json.extract! reviews, :id, :title, :body, :rating, :state, :customer_id, :book_id, :created_at, :updated_at
json.url reviews_url(reviews, format: :json)
