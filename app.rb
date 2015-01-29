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
