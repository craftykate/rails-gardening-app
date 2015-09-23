class AddCategoriesToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :plant_category_id, :integer
  end
end
