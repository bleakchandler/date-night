class Cuisine < ActiveRecord::Base
    has_many :restaurant_cuisines
    has_many :restaurants, through: :restaurant_cuisines

    # def random_by_cuisine
    #     self.restaurants.sample
    # end
    # def gets_restaurant_id
    #     random_by_cuisine.id
    # end  

      

end    