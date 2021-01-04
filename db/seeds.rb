Cuisine.destroy_all 
Neighborhood.destroy_all 
Restaurant.destroy_all 
User.destroy_all 
RestaurantCuisine.destroy_all 
Selection.destroy_all

Cuisine.reset_pk_sequence
Neighborhood.reset_pk_sequence
Restaurant.reset_pk_sequence
User.reset_pk_sequence
RestaurantCuisine.reset_pk_sequence
Selection.reset_pk_sequence 

# Plant.destroy_all
# Person.destroy_all
# PlantParenthood.destroy_all
# Plant.reset_pk_sequence
# Person.reset_pk_sequence
# PlantParenthood.reset_pk_sequence

# ########### different ways to write your seeds ############







# # 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:



User.create( [
    {name: "Jen"},
    {name: "Darien"}

]) 

Cuisine.create([
    {name: "Indian"},
    {name: "Chinese"},
    {name: "Burgers"},
    {name: "Seafood"}
])  

Restaurant.create([
    {name: "The Rex Burger & Lobster", street_address: "524 Jericho Turnpike", phone_number: 5167392747, hours: "12pm-8pm", url: "therexburgerandlobster.com", neighborhood_id: 1},
    {name: "Petey's Burger", street_address: "3017 30th Ave", phone_number: 7182676300, hours "11am-11pm", url: "peteysburgers.com", neighborhood_id: 1},
    {name: "Astoria Dragon & Phoenix", street_address: "2921 Astoria Blvd", phone_number: 7188657656, hours: "11am-11pm", url: "dragon.com", neighborhood_id: 1}
    {name: "Ma Lala", street_address: "4202 30th Ave", phone_number: 7186061898, hours: "12:15pm-10:15pm", url: "ma-lala-chinese.business.site", neighborhood_id: 1}
    {name: "Namaste", street_address: "3115 30th Ave", phone_number: 7186262783, hours: "11am-11pm", url: "namaste-astoria.com", neighborhood_id: 1}
    {name: "Tikka Indian Grill", street_address: "3414 30th Ave", phone_number: 7182551085, hours: "12pm-11pm", url: "tikkaindiangrill.com", neighborhood_id: 1} 
    {name: "Abuqir Seafood", street_address: "2419 Steinway St", phone_number: 7182743474, hours: "12pm-11pm", url: "asg.com", neighborhood_id: 1}
])  

Neighborhood.create([
    {name: "Astoria"}

]) 

RestaurantCuisine.create(restaurant_id: 1, cuisine_id: 3)
RestaurantCuisine.create(restaurant_id: 1, cuisine_id: 4)
RestaurantCuisine.create(restaurant_id: 2, cuisine_id: 3)
RestaurantCuisine.create(restaurant_id: 3, cuisine_id: 2)
RestaurantCuisine.create(restaurant_id: 4, cuisine_id: 2)
RestaurantCuisine.create(restaurant_id: 5, cuisine_id: 1)
RestaurantCuisine.create(restaurant_id: 6, cuisine_id: 1)
RestaurantCuisine.create(restaurant_id: 7, cuisine_id: 4) 




# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}






# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 "