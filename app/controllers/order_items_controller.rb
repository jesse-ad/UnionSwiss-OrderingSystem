class OrderItemsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new
    @skus = current_user.distributor.skus # Only show relevant skus to distributor
    
      @sku_options = @skus.map do |sku|
      [sku.product.name, sku.id]
      end
  end
  
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.build(order_item_params)

    if @order_item.save 
      redirect_to orders_path 
    else
      render :new 
    end
  end

  private
  # Prevent dangerous/unexpected fields from users
  def order_item_params
    params.require(:order_item).permit(:sku_id, :pallets)
  end

  

  
end
