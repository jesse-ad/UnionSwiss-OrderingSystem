class DistributorsController < ApplicationController

  # For displaying distributors
  def index 
    @distributors = Distributor.all
  end

  # Shows form for creating new distributor
  def new
    @distributor = Distributor.new
  end

   # Saves the new product
  def create
    @distributor = Distributor.new(distributor_params)

    if @distributor.save # If the product has been saved
      redirect_to distributors_path # Redirect to the product page
    else
      render :new # create new form
    end
  end

    # Shows form for editing disributor
  def edit 
    @distributor = Distributor.find(params[:id])
  end

  # Saves the edited distributor
  def update
    @distributor = Distributor.find(params[:id])

    if @distributor.update(distributor_params)
      #puts @distributor.inspect
      redirect_to distributors_path
    else
      #puts @distributor.errors.full_messages
      render :edit
    end
  end


  # For deleting a product
  def destroy
    @distributor = Distributor.find(params[:id])

    @distributor.destroy 

    redirect_to distributors_path
  end




  private
  # Prevent dangerous/unexpected fields from users
  def distributor_params
    params.require(:distributor).permit(:name, :currency)
  end

end
