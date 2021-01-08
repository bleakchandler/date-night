module RestaurantApis


  def american_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=1&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def chinese_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=25&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def bbq_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=193&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def burger_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=168&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def greek_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=156&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def healthy_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=143&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def italian_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=55&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def jepanese_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=60&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def mexican_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=73&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def seafood_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=83&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

  def thai_restaurants
    response =  RestClient.get "https://developers.zomato.com/api/v2.1/search?lat=40.7128&lon=74.0060&radius=40233.6&cuisines=93&sort=real_distance", {content_type: :json, accept: :json, "user-key": "b15c0449cabc39ad8fcc569d26d3c0a0"}
    
  end

#   def variable_method
#     binding.pry
#     restaurant_all = american_restaurants, chinese_restaurants, bbq_restaurants, burger_restaurants, greek_restaurants, healthy_restaurants, italian_restaurants, jepanese_restaurants, mexican_restaurants, seafood_restaurants, thai_restaurants

#     body = restaurant_all.body
#     parsed = JSON.parse(body)
#     name = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
#     url = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["url"]}
#     street_address = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["location"]["address"]}
#     cuisine = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["cuisines"]}
#     hours = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["timimgs"]}
#     phone_number = parsed["restaurants"].map{|restaurant| restaurant["restaurant"]["phone_numbers"]}

#   end  
end  