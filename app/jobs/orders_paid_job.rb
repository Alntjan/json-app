class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      data = JSON.parse(request.body.read)
      puts "Cheguei aqui!"
      puts "Olha para isto #{data.id}"
    end
  end
end
