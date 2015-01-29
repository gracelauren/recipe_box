require("spec_helper")

describe(Recipe) do
  it{ should have_and_belong_to_many(:ingredients) }
  it{ should have_and_belong_to_many(:categories) }
  it{ should validate_presence_of(:title)}

  it("will capitalize the title of a recipe") do
    recipe1= Recipe.create({:title => "chicken paramesan", :instructions => "do stuff", :rating => 5})
    expect(recipe1.title()).to eq("Chicken Paramesan")
  end

end
