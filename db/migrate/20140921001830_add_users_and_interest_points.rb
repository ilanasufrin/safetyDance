class AddUsersAndInterestPoints < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps
    end
    add_index :users, :email

    create_table :interest_points do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :interest_points, :latitude
    add_index :interest_points, :longitude
    add_index :interest_points, :user_id
  end
end
