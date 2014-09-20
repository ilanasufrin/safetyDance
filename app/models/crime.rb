class Crime < ActiveRecord::Base

   def change
    create_table :crimes do |t|
      t.float :longitude
      t.float :latitude
      t.integer :year
      t.integer :month
      t.integer :x
      t.integer :y
      t.float :TOT
      t.string :type
 
      t.timestamps
    end
    add_index :latitude, :longitude, :type
  end


end