class PlantCategoriesController < ApplicationController

  def index
    @plant_cats = Plant_category.all.order('name ASC')
  end

  def show
    @plant_cat = Plant_category.find(params[:id])
  end

  def new
    @plant_cat = Plant_category.new
  end

  def create
    @plant_cat = Plant_category.new(plant_category_params)
    if @plant_cat.save
      flash[:success] = "Plant category created!"
      redirect_to new_plant_path
    else
      render :new
    end
  end

  def edit
    @plant_cat = Plant_category.find(params[:id])
  end

  def update
    if @plant_cat.update_attributes(plant_category_params)
      flash[:success] = "Category updated"
      redirect_to @plant_cat
    else
      render :edit
    end
  end

  def destroy
    Plant_category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to new_plant_path
  end

  private

    def plant_generic_name_params
      params.require(:plant_category).permit(:name)
    end
# end private
end
