class Ingredient < ActiveRecord::Base

  has_many :recipes_ingredients

  validates :name, presence: true, uniqueness: true

end