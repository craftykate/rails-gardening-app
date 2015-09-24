class SquaresController < ApplicationController

  def index
    @squares = Square.all
  end

  def show
    @square = Square.find(params[:id])
  end

  def new
    @square = Square.new
    @planter = Planter.find(params[:planter])
    @square.unit = params[:unit]
    unit_options
  end

  def create
    @square = Square.new(square_params)
    @square.planter_id = params[:planter_id]
    if @square.save
      @planter = Planter.find(params[:planter_id])
      flash[:success] = "You planted #{@square.plant.name} in square #{@square.unit}"
      redirect_to planter_path(@planter)
    else
      render :new
    end
  end

  def edit
    @square = Square.find(params[:id])
  end

  def update
    if @square.update_attributes(square_params)
      flash[:success] = "Updated"
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
    else
      render :edit
    end
  end

  def destroy
    Square.find(params[:id]).destroy
    flash[:success] = "Deleted"
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def unit_options
    @unit_options = []
    num = 1
    while num <= (@planter.length * @planter.width) do
      @unit_options << [num]
      num += 1
    end
  end

  private

    def square_params
      params.require(:square).permit(:planter_id, :plant_id, :unit)
    end
# end private
end
