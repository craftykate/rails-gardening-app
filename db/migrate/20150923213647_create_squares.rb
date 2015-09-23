class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.integer :planter_id
      t.integer :plant_id

      t.timestamps
    end
  end
end
