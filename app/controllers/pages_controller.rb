class PagesController < ApplicationController

  before_action :authenticate_user!

  def home
    if current_user.admin?
      redirect_to admin_path
    else
      redirect_to orders_path
    end
  end

  def admin
    @product_count = Product.count
    @distributor_count = Distributor.count
    @sku_count = Sku.count
    @order_count = Order.count
  end
  
end
