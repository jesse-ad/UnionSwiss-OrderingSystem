# Handles CRUD operations for all SKUs.
# Only admins are allowed to access the full SKU list.
class SkusController < ApplicationController
  before_action :require_admin

  # For displaying SKUs
  def index
    @skus = Sku.all
    @distributors = Distributor.all
    @products = Product.all
  end

  # Shows form for creating new SKU
  def new
    @sku = Sku.new
    @distributors = Distributor.all
    @products = Product.all
  end

  # Saves the new SKU to the database.
  def create
    @sku = Sku.new(skus_params)

    if @sku.save # If the  has been saved
      redirect_to skus_path # Redirect to the  page
    else
      render :new # create new form
    end
  end

  # Shows form for editing a SKU
  def edit
    @sku = Sku.find(params[:id])
    @distributors = Distributor.all
    @products = Product.all
  end

  # Saves the edited SKU to the database
  def update
    @sku = Sku.find(params[:id])

    if @sku.update(skus_params)
      redirect_to skus_path
    else
      render :edit
    end
  end


  # Deletes a SKU from the database
  def destroy
    @sku = Sku.find(params[:id])

    if @sku.order_items.exists?
      redirect_to skus_path, alert: "Cannot delete SKU because it has already been used in orders."
      return
    end

    @sku.destroy

    redirect_to skus_path, notice: "SKU deleted successfully."
  end

  private
  # Prevent dangerous/unexpected fields from users
  def skus_params
    params.require(:sku).permit(:distributor_id, :product_id, :price_per_unit)
  end

  # If a user is not an admin, they cannot access the full skus list
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
