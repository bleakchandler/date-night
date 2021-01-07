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
        Restaurant.find(restaurant_id_inst)
    end  
 

    # def random_restaurant
    #     Restaurant.all.sample
    # end  

    def random_restaurant
        restaurant_id_inst = Restaurant.all.sample.id
        Selection.create(restaurant_id: restaurant_id_inst, user_id: self.id)
        Restaurant.find(restaurant_id_inst)
    end 

    def name_of_last_selection 
        self.selections.last.restaurant.name
    end 

    def favorite_last_selection
        self.selections.last.update(favorite: true)
    end 

    # def non_favorite_last_selection
    #     self.selections.last.favorite = false
    # end 

    def favorite_restaurants
        fav_selection = self.selections.where(favorite: true)
        fav_selection.map{|select|select.restaurant}.uniq
    end 

    def delete_a_fav(restaurant_id_inst)
        yucky_selections = self.selections.where(restaurant_id: restaurant_id_inst)
        yucky_selections.destroy_all
    end
end
