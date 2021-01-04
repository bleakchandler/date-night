class Restaurant < ActiveRecord::Base
  has_many :selections
  has_many :users through: :selections
end
