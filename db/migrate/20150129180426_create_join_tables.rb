class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:id_ingredients, :integer)
      t.column(:id_recipes, :integer)
      t.timestamps
    end

    create_table(:categories_recipes) do |t|
      t.column(:id_recipes, :integer)
      t.column(:id_categories, :integer)
      t.timestamps
    end
  end
end
