class User < ActiveRecord::Base
has_many :selections
has_many :restaurants through: :selections
end
