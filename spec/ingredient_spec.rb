require("spec_helper")

describe(Ingredient) do
  it{ should have_and_belong_to_many(:recipes)}
  it{ should validate_presence_of(:ingredient)}

  it("will normalize the ingredient") do
    ingredient = Ingredient.create({:ingredient => "SALT"})
    expect(ingredient.ingredient()).to eq("salt")
  end

  it("will alphabatize the ingredients") do
    ingredient = Ingredient.create({:ingredient => "SALT"})
    ingredient2 = Ingredient.create({:ingredient => "avacado"})
    expect(Ingredient.all()).to eq([ingredient2, ingredient])
  end
end
