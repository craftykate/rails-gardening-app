class PlantersController < ApplicationController

  def index
    @planters = Planter.all.order('name ASC')
  end

  def show
    @planter = Planter.find(params[:id])
  end

  def new
    @planter = Planter.new
  end

  def create
    @planter = Planter.new(planter_params)
    if @planter.save
      flash[:success] = "#{@planter.name} created!"
      redirect_to planters_path
    else
      render :new
    end
  end

  def edit
    @planter = Planter.find(params[:id])
  end

  def update
    if @planter.update_attributes(planter_params)
      flash[:success] = "#{@planter.name} updated!"
      redirect_to @planter
    else
      render :edit
    end
  end

  def destroy
    Planter.find(params[:id]).destroy
    flash[:success] = "Planter deleted"
    redirect_to planters_path
  end

  private

    def planter_params
      params.require(:planter).permit(:name, :length, :width)
    end
# end private
end
