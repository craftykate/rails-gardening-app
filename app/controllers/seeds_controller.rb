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
    if @seed.save
      @planter = Planter.find(params[:planter_id])
      flash[:success] = "Success!"
      redirect_to planter_path(@planter)
    else
      render :new
    end
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def update
    if @seed.update_attributes(seed_params)
      flash[:success] = "Updated"
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
    else
      render :edit
    end
  end

  def destroy
    Seed.find(params[:id]).destroy
    flash[:success] = "Seed deleted"
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private

    def seed_params
      params.require(:seed).permit(:square_id, :square_space, :plant_date)
    end
# end private
end
