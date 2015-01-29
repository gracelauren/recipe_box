class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:title, {:presence => true})
  before_save(:capitalize_title)

  default_scope { order('title') }

private

    define_method(:capitalize_title) do
      self.title = self.title().titlecase()
    end


end
