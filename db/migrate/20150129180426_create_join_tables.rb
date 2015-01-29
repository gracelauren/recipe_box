class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
      t.timestamps
    end

    create_table(:categories_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:category_id, :integer)
      t.timestamps
    end
  end
end
