class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
    	t.string :name
    	t.string :description
    	t.float :price
    	t.references :company
    	t.references :service_type

      t.timestamps null: false
    end
  end
end
