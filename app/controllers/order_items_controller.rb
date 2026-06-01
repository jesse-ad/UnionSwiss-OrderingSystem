# Handles creating, destroying, and incrementing of pallets for order items.
# Submitted orders must have at least one order item.

class OrderItemsController < ApplicationController
  # New order item
  def new
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new
    @skus = current_user.distributor.skus # Only show relevant skus to distributor

      @sku_options = @skus.map do |sku|
        [ sku.product.name, sku.id ]
      end
  end

  # Creates new order item
  def create
    @order = Order.find(params[:order_id])

    if params[:order_item][:sku_id].blank?
      redirect_to order_path(@order),
                  alert: "Please select a product."
      return
    end

    @order_item = @order.order_items.build(order_item_params)

    if @order_item.save
      redirect_to order_path(@order)
    else
      redirect_to order_path(@order),
                  alert: "Unable to add product."
    end
  end

  # Deletes an order item
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order

    @order_item.destroy

    redirect_to order_path(@order)
  end

  # Increments the number of pallets
  def increment
    @order_item = OrderItem.find(params[:id])

    @order_item.update(pallets: @order_item.pallets + 1)

    redirect_to order_path(@order_item.order)
  end

  # Decrements the number of pallets
  def decrement
    @order_item = OrderItem.find(params[:id])

      if @order_item.pallets > 1 # Prevent negative pallets
        @order_item.update(pallets: @order_item.pallets - 1)
      end

      redirect_to order_path(@order_item.order)
  end

  private
  # Prevent dangerous/unexpected fields from users
  def order_item_params
    params.require(:order_item).permit(:sku_id, :pallets)
  end
end
