json.extract! product, :id, :code, :description, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
