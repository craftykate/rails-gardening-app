class AddNotesToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :sun, :text
    add_column :plants, :notes, :text
  end
end
