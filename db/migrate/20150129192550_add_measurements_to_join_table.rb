class AddMeasurementsToJoinTable < ActiveRecord::Migration
  def change
    add_column(:ingredients_recipes, :quantity, :integer)
    add_column(:ingredients_recipes, :unit, :string)

  end
end
