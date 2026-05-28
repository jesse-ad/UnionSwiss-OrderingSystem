class ProductsController < ApplicationController

  # For displaying products
  def index 
    @products = Product.all
  end

  # Shows form for creating new product
  def new
    @product = Product.new
  end

  # Saves the new product
  def create
    @product = Product.new(product_params)

    if @product.save # If the product has been saved
      redirect_to products_path # Redirect to the product page
    else
      render :new # create new form
    end
  end

  # Shows form for editing product
  def edit 
    @product = Product.find(params[:id])
  end

  # Saves the edited product
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end


  # For deleting a product
  def destroy
    @product = Product.find(params[:id])

    @product.destroy 

    redirect_to product_path
  end

  private

  # Prevent dangerous/unexpected fields from users
  def product_params
    params.require(:product).permit(:name)
  end

end
