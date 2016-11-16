json.extract! product, :id, :handle, :image, :title, :vendor, :created_at, :updated_at
json.url product_url(product, format: :json)