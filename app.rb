require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @recipes = Recipe.all()
  erb(:index)
end

post("/recipes") do
  recipe_title= params.fetch('recipe_title')
  Recipe.create({:title=> recipe_title, :instructions => "", :rating => 0})
  redirect('/')
end

get("/recipes/:id") do
  @recipe_id = params.fetch('id').to_i()
recipe = Recipe.find(@recipe_id)
  erb(:recipe)
end

patch("/recipes/:id") do
  @recipe_id = params.fetch('id').to_i()
  recipe = Recipe.find(@recipe_id)
  recipe.update({:title => params.fetch('title'), :instructions => params.fetch('instructions'), :rating => params.fetch('rating').to_i()})
  url = "/recipes/" + @recipe_id.to_s()
  redirect(url)
end

delete("/recipes/:id") do
  @recipe_id = params.fetch('id').to_i()
  recipe = Recipe.find(@recipe_id)
  recipe.delete()
  redirect("/")
end

post("/ingredients") do
  @ingredient_name = params.fetch('ingredient_name')
  @ingredient_qty = params.fetch('ingredient_qty')
  @ingredient_unit = params.fetch('ingredient_unit')
  ingredient = Ingredient.create({:ingredient => @ingredient_name})
  @recipe_id = params.fetch('recipe_id').to_i()
  @recipe = Recipe.find(@recipe_id)
  @recipe.ingredients.push(ingredient)
  # @recipe.ingredients().push(@ingredient_qty)
  # @recipe.ingredients().push(@ingredient_unit)
  url = "/recipes/" + @recipe_id.to_s()
  redirect(url)
end
