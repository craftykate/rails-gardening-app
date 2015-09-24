class AddUnitToSquares < ActiveRecord::Migration
  def change
    add_column :squares, :unit, :integer
  end
end
