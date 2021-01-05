class User < ActiveRecord::Base
has_many :selections
has_many :restaurants, through: :selections

      
 

    def random_by_cuisine(cuisine_id)
        cuisine_choice = Cuisine.all.find{|cuisine| cuisine.id == cuisine_id}
        cuisine_choice.restaurants.sample
    end

    def create_selection_by_cuisine(cuisine_id)
        restaurant_id_inst = random_by_cuisine(cuisine_id).id
        Selection.create(restaurant_id: restaurant_id_inst, user_id: self.id)
    end  
 

    # def random_restaurant
    #     Restaurant.all.sample
    # end  

    def random_restaurant
        restaurant_id_inst = Restaurant.all.sample.id
        Selection.create(restaurant_id: restaurant_id_inst, user_id: self.id)
    end 
end
