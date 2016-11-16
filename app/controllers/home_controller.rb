class HomeController < ShopifyApp::AuthenticatedController
  def index
    @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 10})
    ProductsSyncJob.perform_later
  end
end
