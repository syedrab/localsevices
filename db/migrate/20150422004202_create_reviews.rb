class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.references :transaction
    	t.references :company
    	t.references :user
    	t.float :rating
    	t.text :comment
      t.timestamps null: false
    end
  end
end
