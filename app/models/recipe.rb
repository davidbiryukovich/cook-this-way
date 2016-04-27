class Recipe < ActiveRecord::Base

  has_many :recipes_ingredients, autosave: true
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :directions, :servings, :total_time, presence: true
  validates :servings, :total_time, numericality: { only_integer: true, greater_than: 0 }

  default_scope { where(active: true).order(:name) }

  def ingredients_attributes=(values)
    values = values.map do |value|
      ingredient = Ingredient.where(name: value[:name]).first_or_create
      { ingredient_id: ingredient.id, amount: value[:amount] }
    end

    recipes_ingredients.each do |ri|
      value = values.detect {|v| v[:ingredient_id] == ri.ingredient_id }
      if value
        ri.amount = value[:amount]
      else
        ri.mark_for_destruction
      end
    end

    values.each do |v|
      unless recipes_ingredients.any? { |ri| v[:ingredient_id] == ri.ingredient_id }
        recipes_ingredients.build(v.merge(recipe: self))
      end
    end
  end

end