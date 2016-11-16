class Order < ApplicationRecord
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage
end
