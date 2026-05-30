class PagesController < ApplicationController
  def home
    @product_count = Product.count
    @distributor_count = Distributor.count
    @sku_count = Sku.count
    @order_count = Order.count
  end

  def admin
    
  end
  def distributor
    
  end
end
