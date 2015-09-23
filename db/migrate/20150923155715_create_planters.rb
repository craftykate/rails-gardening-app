class CreatePlanters < ActiveRecord::Migration
  def change
    create_table :planters do |t|
      t.string :name
      t.integer :length
      t.integer :width

      t.timestamps
    end
  end
end
