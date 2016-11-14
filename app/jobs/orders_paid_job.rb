class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      @encomenda = Order.new(shop_id: shop.id, shopify_order_id: webhook[:id], order_data: webhook)
      if @encomenda.save
        puts "Webhook recebido e Encomenda feita!"
      else
        puts "Erro!"
      end
    end
  end
end
