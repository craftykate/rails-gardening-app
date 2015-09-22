class PlantGenericNamesController < ApplicationController

  def index
    @generic_names = Plant_generic_name.all.order('name ASC')
  end

  def show
    @generic_name = Plant_generic_name.find(params[:id])
  end

  def new
    @generic_name = Plant_generic_name.new
  end

  def create
    @generic_name = Plant_generic_name.new(plant_generic_name_params)
    if @generic_name.save
      flash[:success] = "Plant category created!"
      redirect_to new_plant_path
    else
      render :new
    end
  end

  def edit
    @generic_name = Plant_generic_name.find(params[:id])
  end

  def update
    if @generic_name.update_attributes(plant_generic_name_params)
      flash[:success] = "Category updated"
      redirect_to @generic_name
    else
      render :edit
    end
  end

  def destroy
    Plant_generic_name.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to new_plant_path
  end

  private

    def plant_generic_name_params
      params.require(:plant_generic_name).permit(:name)
    end
# end private
end
