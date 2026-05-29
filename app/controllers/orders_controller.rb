class OrdersController < ApplicationController

  # For displaying 
  def index 
    @order = Order.all
  end

  # Shows form for creating new 
  def new
    @order = Order.new
  end

   # Saves the new 
  def create
    
    @order = Order.new(order_params)

    @order.user = current_user
    @order.distributor = current_user.distributor

    if @order.save # If the    has been saved
      redirect_to orders_path # Redirect to the   page
    else
      render :new # create new form
    end
  end

  def show 
    @order = Order.find(params[:id])
  end

  private
  # Prevent dangerous/unexpected fields from users
  def order_params
    params.require(:order).permit(:required_delivery_date)
  end

end

