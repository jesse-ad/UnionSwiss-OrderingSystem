class OrdersController < ApplicationController

  before_action :require_distributor, only: [:new, :create]
  
  # For displaying 
  def index 
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.distributor.orders
    end
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

  def edit
    @order = Order.find(params[:id])
  end

  # for updating status
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  private
  # Prevent dangerous/unexpected fields from users
  def order_params
    params.require(:order).permit(:required_delivery_date, :status)
  end

   private
  # If a user is not a distributor, they cannot create orders
  def require_distributor
    unless current_user.distributor?
      redirect_to root_path
    end
  end


end

