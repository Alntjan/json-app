class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      @encomenda = Order.new(shop_id: 1, shopify_order_id: 12345678910, order_data: :webhook)
      @encomenda.save
    end
  end
end
