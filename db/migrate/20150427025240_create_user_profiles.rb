class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :middlename
    	t.string :phone
    	t.text :address1
    	t.text :address2
    	t.string :city
    	t.string :province
    	t.string :postal_code
    	t.string :country
    	t.references :user
      t.timestamps null: false
    end
  end
end