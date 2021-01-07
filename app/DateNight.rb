

class DateNight
  attr_reader :prompt
  attr_accessor :user 
  # here will be your CLI!
  # it is not an AR class so you need to add attr
  def initialize
    @prompt = TTY::Prompt.new
  end

  def run  
    welcome
    # login_or_signup
    # wanna_see_favs?
    # get_joke(what_subject)
  end


  def welcome
    puts "Welcome to Date Night!"
    sleep(1)
    prompt.select("Sign in or Sign up") do |menu|
      menu.choice "Sign in", -> { sign_in_helper }
      menu.choice "Sign up", -> { sign_up_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end

  def sign_in_helper 
    name = prompt.ask("What is your username?")
    if self.user = User.find_by(name: name) 
      puts "Welcome back #{user.name}!"
      did_you_like
    else
      puts "username not found"
      sign_up_helper
    end  
  end
  
  def did_you_like
    sleep(1.5)
    while user.selections.length >= 1 
      last_restaurant
    end   
    main_menu
  end  

  def sign_up_helper 
    name = prompt.ask("Create a username?")
          while User.find_by(name: name)
              puts "This username is already taken"
              name = prompt.ask("What is your username?")
          end
          self.user = User.create(name: name)
          puts "Hello #{user.name}!"
          main_menu
  end 

  
  

  # private

  def last_restaurant
    last_dinning = prompt.yes?("Did you enjoy your experience at #{user.name_of_last_selection}?")
    if last_dinning 
    user.favorite_last_selection
    end
    main_menu
  end 

  def main_menu
    prompt.select("Choose your Adventure!") do |menu|
      menu.choice "See your Favorites", -> { favorites_helper }
      menu.choice "Choose a Restaurant by cuisine", -> { restaurant_by_cuisine_helper}
      menu.choice "Surprise me!", -> { random_resturant_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end 
  
  def favorites_helper
    favs = user.favorite_restaurants
    favs.each{|fav| puts " ", fav.name, fav.street_address,fav.phone_number, fav.hours, fav.url, " " }

    # favs.each do |fav|
    # table = TTY::Table.new([{puts " fav.name" => ["a1", "a2"], "h2" => ["b1", "b2"]}])
    # end
    # puts table.render(:ascii)
   
    # table(border: true) do
    #   row header: true do
    #     column('NAME', width: 17)
    #     column('ADDRESS', width: 21)
    #     column('PHONE #', width: 14, align: 'center')
    #     column('YELP  RATING', width: 6, align: 'center')
    #   end
    #   favs.each do |fav|
    #     row do
    #       column(puts fav.name)
    #       column(puts fav.street_addess)
    #       column(puts fav.hours)
    #       column(puts fav.url)
    #     end
    #   end
    # end
          
    # i= 0  
    # user.favorite_restaurants[i] < user.favorite_restaurants.length, i++ 
    # user.favorite_restaurants[i].name

    # table << user.favorite_restaurants.each{|restaurant|puts restaurant.name}




    prompt.select(" ") do |menu|
      menu.choice "Update you Favorites", -> { update_favs_helper}
      menu.choice "Main Menu", -> { main_menu}
      menu.choice "Exit", -> { exit_helper}
    end

  end  

  def random_resturant_helper
    puts "#{user.random_restaurant}"
    prompt.select(" ") do |menu|
      menu.choice "Give it a Try", -> { exit_helper}
      menu.choice "Select again", -> { main_menu}
    end
  end
  
  def restaurant_by_cuisine_helper
    cuisine = Cuisine.all_names
      cuisine_id = prompt.select("Which Cuisine would you like?", cuisine)
     puts "#{user.create_selection_by_cuisine(cuisine_id)}"
    prompt.select(" ") do |menu|
      menu.choice "Give it a Try", -> { exit_helper}
      menu.choice "Select again", -> { main_menu}
    end
  end

  def update_favs_helper
    favs = user.favorite_restaurants.map{|fav|fav.name}

      restaurant_name = prompt.select("Which Restaurant would you like to Delete?", favs)
      restaurant_inst = Restaurant.where(name: restaurant_name)
      restaurant_id_inst = restaurant_inst[0].id
      user.delete_a_fav(restaurant_id_inst)
      puts "#{restaurant_name} has been removed from your Favorites!"
      main_menu
  end
  
  def exit_helper 
      puts "Enjoy your Meal!"
      exit
  end 
  
end


 

#   def plants_helper
#       puts "here are the plants:"
#   end

#   def user_sign_up_helper
#       name = prompt.ask("What is your username?")
#       while Person.find_by(name: name)
#           puts "This username is already taken"
#           name = prompt.ask("What is your username?")
#       end
#       age = prompt.ask("How old are you?").to_i
#       responsible = prompt.yes?("Are you responsible?")
#       self.user = Person.create(name: name, age:age, responsible: responsible)
#       puts "Hello #{user.name}!"
#       main_screen
#   end

#   def main_screen
#       system 'clear'
#       user.reload
#       sleep(0.5)
#       prompt.select("What do you want to do?") do |menu|
#           menu.choice "See all the plants", -> { plants_helper }
#           menu.choice "Adopt a plant", -> { adoption_helper}
#           menu.choice "Exit", -> { exit_helper}
#         end  
#   end

#   def adoption_helper
#       plants = Plant.all_names
#       chosen_plant_id = prompt.select("Which plant do you want to adopt?", plants)
#       affection = prompt.ask("From 1-10, how affectionate do you feel towards this plant?").to_i
#       pp = PlantParenthood.create(plant_id: chosen_plant_id, person_id: user.id, affection: affection)
#       puts "Congratulations! You have adopted #{pp.plant.species}!"
#       sleep(1)
#       main_screen
#       # 1. choose a plant -> display a list of plant names
#       # 2. create a new plant_parenthood between the user and the plant
#   end



# end