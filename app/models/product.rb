class Product < ApplicationRecord
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage
end
