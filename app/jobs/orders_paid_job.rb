class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      puts "Webhook recebido!"
      data = ActiveSupport::JSON.decode(request.body.read)
      puts "Identificação da Loja: #{shop.id}"
      puts "Identificação da Encomenda: #{data.id}"

      # @paid_order = Order.new({ "shop_id": "acme", "shopify_order_id": params[:webhook.], "order_data": "" })
    end
  end
end
