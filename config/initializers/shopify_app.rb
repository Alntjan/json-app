ShopifyApp.configure do |config|

  config.api_key = "b00b233f7173f9281542a36e2970b6a7"
  config.secret = "e7c34b8da0e4a07a1b141f495b51dcbe"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.webhooks = [
    {topic: 'orders/create', address: 'https://nova-mws.herokuapp.com/webhooks/orders_create', format: 'json'},
    {topic: 'orders/paid', address: 'https://nova-mws.herokuapp.com/webhooks/orders_paid', format: 'json'},
  ]
end
