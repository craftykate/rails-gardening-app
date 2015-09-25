class StaticPagesController < ApplicationController
  def index
  end

  def schedule
  	@seeds = Seed.all.where(planted: false).where('plant_date <= ?', (Time.now + (30 * 86400))).order('plant_date ASC')
    @seeds = @seeds.sort_by { |s| [ s.plant_date, s.square.plant.plant_category.name, s.square.plant.plant_generic_name.name, s.square.plant.name, s.square.planter.name, s.square.unit, s.square_space  ] }

  end

  def message_planter
  	planter = Planter.find(params[:id])
  	message = params[:message]
		flash[:notice] = message
		redirect_to planter_path(planter)
  end
end
