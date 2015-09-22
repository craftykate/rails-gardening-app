class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.boolean :climb
      t.integer :persqft
      t.integer :first_planting
      t.integer :first_planting_duration
      t.integer :first_planting_maturity
      t.integer :second_planting
      t.integer :second_planting_duration
      t.integer :second_planting_maturity

      t.timestamps
    end
  end
end
