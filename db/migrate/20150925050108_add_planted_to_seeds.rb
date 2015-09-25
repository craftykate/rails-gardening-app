class AddPlantedToSeeds < ActiveRecord::Migration
  def change
    add_column :seeds, :planted, :boolean
  end
end
