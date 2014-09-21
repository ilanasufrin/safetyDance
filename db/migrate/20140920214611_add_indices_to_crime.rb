class AddIndicesToCrime < ActiveRecord::Migration
  def change
    add_index :crimes, :latitude
    add_index :crimes, :longitude
    add_index :crimes, :crimeType
  end
end
