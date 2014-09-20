class AddFieldsToCrime < ActiveRecord::Migration
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
    

  end
end
