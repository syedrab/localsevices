class AddProfileToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :user_profile, index: true
    add_foreign_key :users, :user_profile
  end
end
