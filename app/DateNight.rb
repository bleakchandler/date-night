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

  def romantic_music 
    pid = fork{exec 'afplay', "10sec DateNight.mp3"}
  end

  def dinner_audio 
    pid = fork{exec 'afplay', "dinner audio.mp3"}
  end

  def wine_cheers 
    pid = fork{exec 'afplay', "wineeeee.mp3"}
  end

  def banner
    puts"
    $$$$$$$l             $$l                     $$l   $$l $$l           $$l        $$l     
    $$  __$$l            $$ |                    $$$l  $$ |l__|          $$ |       $$ |    
    $$ |  $$ | $$$$$$l $$$$$$l    $$$$$$l        $$$$l $$ |$$l  $$$$$$l  $$$$$$$l $$$$$$l   
    $$ |  $$ | l____$$ll_$$  _|  $$  __$$l       $$ $$l$$ |$$ |$$  __$$l $$  __$$ll_$$  _|  
    $$ |  $$ | $$$$$$$ | $$ |    $$$$$$$$ |      $$ l$$$$ |$$ |$$ /  $$ |$$ |  $$ | $$ |    
    $$ |  $$ |$$  __$$ | $$ |$$l $$   ____|      $$ |l$$$ |$$ |$$ |  $$ |$$ |  $$ | $$ |$$l 
    $$$$$$$  |l$$$$$$$ | l$$$$  |l $$$$$$$l      $$ | l$$ |$$ |l$$$$$$$ |$$ |  $$ | l$$$$  |
    l_______/  l_______|  l____/  l_______|      l__|  l__|l__| l____$$ |l__|  l__|  l____/ 
                                                               $$l   $$ |                   
                                                               l$$$$$$  |                   
                                                                l______/                    
    ".colorize(:light_magenta)
  end  

  def welcome
    romantic_music
    sleep(2)
    puts "Welcome to...".colorize(:magenta)
    sleep(2)
    banner
    sleep(2)
    dinner_audio
    sleep(4)
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
    last_restaurant while user.selections.length >= 1 
    main_menu
  end  

  def sign_up_helper 
    name = prompt.ask("Please, create a username")
          while User.find_by(name: name)
              puts "This username is already taken"
              name = prompt.ask("What is your username?")
          end
          self.user = User.create(name: name)
          puts "Hello #{user.name}!"
          main_menu
  end 

  # def intro 
  #   name = prompt.ask("Please enter a username")
  #   if self.user = User.find_by(name: name) 
  #     puts "Welcome back #{user.name}!"
  #   else

    
  # end 
  

  # private

  def last_restaurant
    last_dinning = prompt.yes?("Did you enjoy your experience at #{user.name_of_last_selection}?")
    user.favorite_last_selection if last_dinning 
    main_menu
  end 

  def main_menu
    system 'clear'
    banner
    prompt.select("Choose your Adventure!") do |menu|
      menu.choice "See your Favorites", -> { favorites_helper }
      menu.choice "Choose a Restaurant by cuisine", -> { restaurant_by_cuisine_helper}
      menu.choice "Surprise me!", -> { random_resturant_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end 

  def new_user_menu 
    prompt.select("Choose your Adventure!") do |menu|
      menu.choice "Choose a Restaurant by cuisine", -> { restaurant_by_cuisine_helper}
      menu.choice "Surprise me!", -> { random_resturant_helper}
      menu.choice "Exit", -> { exit_helper}
    end 
  end 
  
  def favorites_helper
    favs = user.favorite_restaurants 
    if favs.length == 0
      puts "You have no favorites :("
      new_user_menu
    end
    favs.each{|fav| puts "\n", fav.name, fav.street_address,fav.phone_number, fav.hours, fav.url, "\n "}

    prompt.select(" ") do |menu|
      menu.choice "Update you Favorites", -> { update_favs_helper}
      menu.choice "Main Menu", -> { main_menu}
      menu.choice "Exit", -> { exit_helper}
    end

  end  

  def random_resturant_helper
    restaurant_selection = user.random_restaurant  
    prompt.select("\n#{restaurant_selection.name} \n#{restaurant_selection.street_address} \n#{restaurant_selection.phone_number} \n#{restaurant_selection.url}\n\n") do |menu|
      menu.choice "Give it a Try", -> { exit_helper}
      menu.choice "Select again", -> { random_resturant_helper}
      menu.choice "Choose a Restaurant by cuisine", -> { restaurant_by_cuisine_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end 
  
  def restaurant_by_cuisine_helper
    cuisine = Cuisine.all_names
      cuisine_id = prompt.select("Which Cuisine would you like?", cuisine)
    restaurant_selection = user.create_selection_by_cuisine(cuisine_id)
    prompt.select("\n#{restaurant_selection.name} \n#{restaurant_selection.street_address} \n#{restaurant_selection.phone_number} \n#{restaurant_selection.url}\n\n") do |menu|
      menu.choice "Give it a Try", -> { exit_helper}
      menu.choice "Select again", -> { restaurant_by_cuisine_helper }
      menu.choice "Main Menu", -> { main_menu}
      menu.choice "Exit", -> { exit_helper}
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
      system 'clear'
      wine_cheers
      puts "
      /$$$$$$$$                                                                                       /$$      /$$                     /$$ /$$
     | $$_____/                                                                                      | $$$    /$$$                    | $$| $$
     | $$       /$$$$$$$  /$$  /$$$$$$  /$$   /$$       /$$   /$$  /$$$$$$  /$$   /$$  /$$$$$$       | $$$$  /$$$$  /$$$$$$   /$$$$$$ | $$| $$
     | $$$$$   | $$__  $$|__/ /$$__  $$| $$  | $$      | $$  | $$ /$$__  $$| $$  | $$ /$$__  $$      | $$ $$/$$ $$ /$$__  $$ |____  $$| $$| $$
     | $$__/   | $$  l $$ /$$| $$  l $$| $$  | $$      | $$  | $$| $$  l $$| $$  | $$| $$  l__/      | $$  $$$| $$| $$$$$$$$  /$$$$$$$| $$|__/
     | $$      | $$  | $$| $$| $$  | $$| $$  | $$      | $$  | $$| $$  | $$| $$  | $$| $$            | $$  $  | $$| $$_____/ /$$__  $$| $$
     | $$$$$$$$| $$  | $$| $$|  $$$$$$/|  $$$$$$$      |  $$$$$$$|  $$$$$$/|  $$$$$$/| $$            | $$ l/  | $$|  $$$$$$$|  $$$$$$$| $$/$$
     |________/|__/  |__/| $$ l______/  l____  $$       l____  $$ l______/  l______/ |__/            |__/     |__/ l_______/ l_______/|__/|__/
                    /$$  | $$           /$$  | $$       /$$  | $$                                                                         
                   |  $$$$$$/          |  $$$$$$/      |  $$$$$$/                                                                         
                    l______/            l______/        l______/                                                                          ".colorize(:light_magenta)
     
      sleep(2)
      exit
  end 
  
end
