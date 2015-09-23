class CreatePlantCategories < ActiveRecord::Migration
  def change
    create_table :plant_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
