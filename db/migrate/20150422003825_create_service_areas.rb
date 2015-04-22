class CreateServiceAreas < ActiveRecord::Migration
  def change
    create_table :service_areas do |t|
    	t.string :city
    	t.references :service
    	t.references :company
    	
      t.timestamps null: false
    end
  end
end
