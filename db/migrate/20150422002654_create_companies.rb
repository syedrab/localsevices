class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :name
    	t.text :description
    	t.string :website
    	t.string :email
    	t.string :phone
    	t.string :fax
    	t.text :address1
    	t.text :address2
    	t.string :city
    	t.string :province
    	t.string :postal_code
    	t.string :country
    	t.string :image_url
    	t.references :user

      t.timestamps null: false
    end
  end
end
