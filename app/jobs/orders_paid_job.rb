class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      json_data = JSON.parse webhook
      @encomenda = json_data['id']
      puts "ORDER ID: #{@encomenda}"

    end
  end
end
