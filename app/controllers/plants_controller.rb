class PlantsController < ApplicationController

  def index
    @plants = Plant.all.order('name ASC')
  end

  def show
    @plant = Plant.find(params[:id])
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @first_title = ""
    if @plant.second_planting == nil
      @first_title = "Planting Dates"
    else 
      @first_title = "First Planting Dates"
    end
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
      plantname = params[:plant][:name]
      flash[:success] = "#{plantname} created!"
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])

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

  def update
    @plant = Plant.find(params[:id])
    if @plant.update_attributes(plant_params)
      plantname = params[:plant][:name]
      flash[:success] = "#{plantname} updated!"
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    plant = Plant.find(params[:id])
    plantname = plant.name
    Plant.find(params[:id]).destroy
    flash[:success] = "#{plantname} deleted"
    redirect_to plants_path
  end

  private

    def plant_params
      params.require(:plant).permit(:name, :plant_generic_name_id, :climb, :persqft, :sun, :first_planting, :first_planting_duration, :first_planting_maturity, :second_planting, :second_planting_duration, :second_planting_maturity, :notes)
    end
# end private
end
