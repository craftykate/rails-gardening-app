class SeedsController < ApplicationController
  def index
    @seeds = Seed.all
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def new
    @seed = Seed.new
    @planter = Planter.find(params[:planter_id])
    @square = Square.find(params[:square_id])
    @square_space = params[:square_space]
    @plant = @square.plant
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @first_title = ""
    if @plant.second_planting == nil
      @first_title = "Planting Dates"
    else 
      @first_title = "First Planting Dates"
    end
  end

  def create
    @seed = Seed.new(seed_params)
    @seed.square_id = params[:square_id]
    @seed.square_space = params[:square_space]
    @square = Square.find(params[:square_id])
    if @seed.save
      @planter = Planter.find(params[:planter_id])
      if @seed.planted == true
        planted = "in the ground"
      else
        planted = "not in the ground"
      end
      flash[:success] = "#{@seed.square.plant.name} chosen for Square #{@square.unit}, Seed #{@seed.square_space} on #{@seed.plant_date.strftime("%b %d '%y")} and #{planted}."
      redirect_to planter_path(@planter)
    else
      render :new
    end
  end

  def edit
    @seed = Seed.find(params[:id])
    @planter = Planter.find(params[:planter_id])
    @square = Square.find(params[:square_id])
    @square_space = params[:square_space]
    @plant = @square.plant
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @first_title = ""
    if @plant.second_planting == nil
      @first_title = "Planting Dates"
    else 
      @first_title = "First Planting Dates"
    end
  end

  def update
    @seed = Seed.find(params[:id])
    @seed.square_id = params[:square_id]
    @seed.square_space = params[:square_space]
    @planter = Planter.find(params[:planter_id])
    @square = Square.find(params[:square_id])
    if @seed.update_attributes(seed_params)
      if @seed.planted == true
        planted = "in the ground"
      else
        planted = "not in the ground"
      end
      flash[:success] = "#{@seed.square.plant.name} in Square #{@square.unit}, Seed #{@seed.square_space} updated to #{@seed.plant_date.strftime("%b %d '%y")} and #{planted}."
      redirect_to planter_path(@planter)
    else
      render :edit
    end
  end

  def destroy
    @seed = Seed.find(params[:id])
    @plant = @seed.square.plant.name
    @square = @seed.square.unit
    @planter = @seed.square.planter.id
    @seed.destroy
    flash[:success] = "#{@plant} deleted from Square #{@square}, Seed #{@seed.square_space}."
    redirect_to planter_path(@planter)
  end

  private

    def seed_params
      params.require(:seed).permit(:square_id, :square_space, :plant_date, :planted)
    end
# end private
end
