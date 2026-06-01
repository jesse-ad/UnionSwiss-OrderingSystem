# Handles CRUD operations for products.
# Only administrators may access this controller.
class ProductsController < ApplicationController
  before_action :require_admin

  # For displaying products
  def index
    @products = Product.all
  end

  # Shows form for creating new product
  def new
    @product = Product.new
  end

  # Saves the new product to the database
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  # Shows form for editing product
  def edit
    @product = Product.find(params[:id])
  end

  # Saves the edited product to the database
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end


  # Deletes a product from the database
  def destroy
    @product = Product.find(params[:id])

    if @product.skus.exists? # If product is linked to a SK, it cannot be deleted.
      redirect_to products_path, alert: "Cannot delete product because it is linked to existing SKUs."
      return
    end

    @product.destroy

    redirect_to products_path, notice: "Product deleted successfully."
  end


  private

  # Prevent dangerous/unexpected fields from users
  def product_params
    params.require(:product).permit(:name)
  end

  # If a user is not an admin, they cannot access the products list
  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
