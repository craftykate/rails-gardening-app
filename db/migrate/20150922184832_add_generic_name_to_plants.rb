class AddGenericNameToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :plant_generic_name_id, :integer
  end
end
