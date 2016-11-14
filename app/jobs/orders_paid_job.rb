class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      @encomenda = Order.new(shop_id: shop.id, shopify_order_id: id, order_data: webhook)
      @encomenda.save
    end
  end
end
