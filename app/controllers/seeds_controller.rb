class SeedsController < ApplicationController
  def index
    @seeds = Seed.all
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def new
    @seed = Seed.new
    @square = Square.find(params[:square])
    @seed.square_space = params[:unit]
    @planter = Planter.find(params[:planter])
  end

  def create
    @seed = Seed.new(seed_params)
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
      params.require(:seed).permit(:square_id, :square_space, :date)
    end
# end private
end
