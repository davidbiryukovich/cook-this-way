class Cluck < ActiveRecord::Base

  validates :cluck, presence: true

  default_scope { order('id desc') }

end