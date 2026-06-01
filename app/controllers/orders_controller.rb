# Handles CRUD operations for all orders.
# Admins can only view orders and change its status.
# Distributors can create and view their orders.
class OrdersController < ApplicationController
  before_action :require_distributor, only: [ :new, :create ]

  # For displaying an order
  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.distributor.orders
    end
  end

  # Shows form for creating new order
  def new
    @order = Order.new
  end

  # Saves the new order to the database
  def create
    @order = Order.new(order_params)

    @order.user = current_user
    @order.distributor = current_user.distributor

    if @order.save
      redirect_to order_path(@order)
    else
      flash.now[:alert] = @order.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  # Shows the order
  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  # Updates order in database
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  # Submits an order
  def submit
    @order = Order.find(params[:id])

    if @order.order_items.empty? # If no orders, don't allow user to submit the order
      redirect_to order_path(@order),
                  alert: "You must add at least one product before submitting."
      return
    end

    @order.update(status: "pending") # Default path once submitted

    redirect_to orders_path,
                notice: "Order submitted successfully."
  end

  private
  # Prevent dangerous/unexpected fields from users
  def order_params
    params.require(:order).permit(:required_delivery_date, :status)
  end

  # If a user is not a distributor, they cannot create orders
  def require_distributor
    unless current_user.distributor?
      redirect_to root_path
    end
  end
end
