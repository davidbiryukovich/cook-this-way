class RecipesIngredient < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, :ingredient_id, :amount, presence: true

end