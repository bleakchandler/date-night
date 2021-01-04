class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.boolean :favorite 
    
    end  
  end
end
