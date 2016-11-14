class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      json_data = JSON.parse webhook
      @encomenda = Order.create(shop_id: shop.id, shopify_order_id: json_data['id'], order_data: :webhook)
      @encomenda.save
    end
  end
end
