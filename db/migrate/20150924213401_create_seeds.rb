class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.integer :square_id
      t.integer :square_space
      t.date :plant_date

      t.timestamps
    end
  end
end
