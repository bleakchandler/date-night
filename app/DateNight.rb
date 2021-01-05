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
    self.user = User.find_by(name: name) 
      puts "Welcome back #{user.name}!"
    # else sign_up_helper 
    sleep(1.5)
    last_restaurant
    
  end  

  def sign_up_helper 
    name = prompt.ask("What is your username?")
          while User.find_by(name: name)
              puts "This username is already taken"
              name = prompt.ask("What is your username?")
          end
          self.user = User.create(name: name)
          puts "Hello #{user.name}!"
          main_menu
  end 

  def exit_helper 
      puts "Enjoy your Meal!"
  end 

  private

  def last_restaurant
    last_dinning = prompt.yes?("Did you enjoy your experience at #{user.name_of_last_selection}?")
    if last_dinning == true
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
    puts "#{user.favorite_restaurants}"
    prompt.select(" ") do |menu|
      menu.choice "Update you Favorites", -> { update_favs_helper}
      menu.choice "Main Menu", -> { main_menu}
      menu.choice "Exit", -> { exit_helper}
    end

  end  

  def random_resturant_helper
  end
  
  def restaurant_by_cuisine_helper
  end

  def update_favs_helper
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