# Handles CRUD operations for distributors.
# Only admins may have access to the distributor list.
class DistributorsController < ApplicationController
  before_action :require_admin

  # Displays distributors
  def index
    @distributors = Distributor.all
  end

  # Shows form for creating new distributor
  def new
    @distributor = Distributor.new
  end

  # Saves the new distributor to the database
  def create
    @distributor = Distributor.new(distributor_params)

    if @distributor.save

      # Create new distributor with email and password
      User.create(email: params[:email], password: params[:password], role: "distributor", distributor: @distributor)

      redirect_to distributors_path
    else
      render :new
    end
  end

  # Shows form for editing disributor
  def edit
    @distributor = Distributor.find(params[:id])
  end

  # Saves the edited distributor to the database
  def update
    @distributor = Distributor.find(params[:id])

    if @distributor.update(distributor_params)
      redirect_to distributors_path
    else
      render :edit
    end
  end

  # Deletes a distributor
  def destroy
    @distributor = Distributor.find(params[:id])

    if @distributor.orders.exists? || @distributor.skus.exists?
      redirect_to distributors_path, alert: "Cannot delete distributor because it is linked to orders or SKUs."
      return
    end

    @distributor.destroy

    redirect_to distributors_path, notice: "Distributor deleted successfully."
  end


  private
  # Prevent dangerous/unexpected fields from users
  def distributor_params
    params.require(:distributor).permit(:name, :currency)
  end

  # If a user is not an admin, they cannot access the distributors list
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
