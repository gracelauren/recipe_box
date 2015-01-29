class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:instructions, :string)
      t.column(:rating, :integer)

      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:ingredient, :string)

      t.timestamps
    end

    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps
    end
  end
end
