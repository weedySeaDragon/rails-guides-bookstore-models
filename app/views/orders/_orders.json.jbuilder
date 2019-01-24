json.extract! orders, :id, :date_submitted, :customer_id, :status, :subtotal, :shipping, :tax, :total, :created_at, :updated_at
json.url orders_url(orders, format: :json)
