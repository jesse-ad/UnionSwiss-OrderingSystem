class PagesController < ApplicationController

  before_action :authenticate_user!

  def home
    if current_user.admin?
      redirect_to admin_path
    else
      redirect_to distributor_dashboard_path
    end
  end

  def admin
    @product_count = Product.count
    @distributor_count = Distributor.count
    @sku_count = Sku.count
    @order_count = Order.count
    @pending_orders = Order.where(status: "pending").count
    @processing_orders = Order.where(status: "processing").count
    @delivered_orders = Order.where(status: "delivered").count
    @cancelled_orders = Order.where(status: "cancelled").count
  end

  def distributor
  @skus = current_user.distributor.skus.includes(:product)

  @recent_orders = current_user.distributor.orders
                                .order(created_at: :desc)
                                .limit(5)
  end
end
