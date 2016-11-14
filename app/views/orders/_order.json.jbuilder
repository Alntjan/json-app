json.extract! order, :id, :shop_id, :shopify_order_id, :order_data, :created_at, :updated_at
json.url order_url(order, format: :json)