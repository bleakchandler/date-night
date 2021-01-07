class Cuisine < ActiveRecord::Base
    has_many :restaurant_cuisines
    has_many :restaurants, through: :restaurant_cuisines

    # def random_by_cuisine
    #     self.restaurants.sample
    # end
    # def gets_restaurant_id
    #     random_by_cuisine.id
    # end  

    def self.all_names
        self.all.map{|cuisine| {cuisine.name => cuisine.id}}
    end

    def api_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?count=200&lat=40.7128&lon=74.0060&radius=40233.6&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}
      end

      def american_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=1&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}
    
    
      end

      def chinese_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=25&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def bbq_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=193&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def burger_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=168&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def greek_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=156&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def healthy_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=143&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def italian_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=55&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def jepanese_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=60&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def mexican_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=73&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def seafood_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=83&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

      def thai_restaurants
        response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=93&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
        
        body = response.body
        parsed = JSON.parse(body)
        name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
        url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
        street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
        cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
        hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
        phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

      end

end    