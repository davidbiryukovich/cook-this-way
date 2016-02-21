class Recipe < ActiveRecord::Base

  has_many :recipes_ingredients
  #has_and_belongs_to_many :ingredients

  validates :name, presence: true, uniqueness: true
  validates :directions, :servings, :total_time, presence: true
  validates :servings, :total_time, numericality: { only_integer: true, greater_than: 0 }

  def ingredients_attributes=(values)
    RecipesIngredient.where(recipe_id: id).destroy_all if id

    values.each do |value|
      ingredient = Ingredient.where(name: value[:name]).first_or_create
      RecipesIngredient.create(recipe: self, ingredient: ingredient, amount: value[:amount])
    end
  end

end