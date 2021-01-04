class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.integer :phone_number
      t.string :hours
      t.string :url
      t.integer :neighborhood_id 
    end

  end
end
