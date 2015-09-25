class StaticPagesController < ApplicationController
  def index
  end

  def schedule
  	@seeds = Seed.all.where(planted: false).where('plant_date <= ?', (Time.now + (30 * 86400))).order('plant_date ASC')

  end

  def message_planter
  	planter = Planter.find(params[:id])
  	message = params[:message]
		flash[:notice] = message
		redirect_to planter_path(planter)
  end
end
