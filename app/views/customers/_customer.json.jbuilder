json.extract! customer, :id, :first_name, :last_name, :title, :email, :visits, :orders_count, :lock_version, :created_at, :updated_at
json.url customer_url(customer, format: :json)
