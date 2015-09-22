class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new

    # Square foot drop down options
    @sqft_options = []
    num = 1
    while num <= 16 do
    	@sqft_options << [num, num]
    	num += 1
    end
    @sqft_options << ['1 per 2 sq feet', 17]

    # Month drop down options
    @month_options = []
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    num = 1
    while num <= 12 do 
    	i = num - 1
    	@month_options << ["#{months[i]}", num]
    	num += 1
    end
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      flash[:success] = "Plant saved!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    if @plant.update_attributes(plant_params)
      flash[:success] = "Plant updated"
      redirect_to @plant
    else
      render :edit
    end
  end

  def destroy
    Plant.find(params[:id]).destroy
    flash[:success] = "Plant deleted"
    redirect_to root_path
  end

  private

    def plant_params
      params.require(:plant).permit(:name, :climb, :persqft, :first_planting, :first_planting_duration, :first_planting_maturity, :second_planting, :second_planting_duration, :second_planting_maturity)
    end
# end private
end
