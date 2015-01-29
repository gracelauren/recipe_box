class Ingredient < ActiveRecord::Base
  validates(:ingredient, {:presence => true})
  has_and_belongs_to_many(:recipes)
  before_save(:normalize_ingredient)

  default_scope { order('ingredient') }

private

  define_method(:normalize_ingredient) do
    self.ingredient = self.ingredient().downcase()
  end

end
