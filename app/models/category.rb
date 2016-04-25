class Category < ActiveRecord::Base

  has_many :recipes

  validates :name, presence: true

  default_scope { order('id desc') }

end