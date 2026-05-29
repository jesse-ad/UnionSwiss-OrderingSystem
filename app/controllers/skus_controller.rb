class SkusController < ApplicationController

  # For displaying 
  def index 
    @skus = Sku.all
    @distributor = Distributor.all
    @product = Product.all
  end

  # Shows form for creating new 
  def new
    @skus = Sku.new
    @distributor = Distributor.all
    @product = Product.all
  end

   # Saves the new
  def create
    @skus = Sku.new(skus_params)

    if @skus.save # If the  has been saved
      redirect_to skus_path # Redirect to the  page
    else
      render :new # create new form
    end
  end

    # Shows form for editing 
  def edit 
    @skus = Sku.find(params[:id])
    @distributor = Distributor.all
    @product = Product.all
  end

  # Saves the edited 
  def update
    @skus = Sku.find(params[:id])

    if @sku.update(skus_params)
      redirect_to skus_path
    else
      render :edit
    end
  end


  # For deleting a 
  def destroy
    @skus = Sku.find(params[:id])

    @skus.destroy 

    redirect_to skus_path
  end




  private
  # Prevent dangerous/unexpected fields from users
  def skus_params
    params.require(:sku).permit(:distributor_id, :product_id, :price_per_unit)
  end

end


