class Recipe < ActiveRecord::Base

  validates :name, :directions, :servings, :total_time, presence: true
  validates :servings, :total_time, numericality: { only_integer: true, greater_than: 0 }

end