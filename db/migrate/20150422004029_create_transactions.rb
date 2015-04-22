class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.references :service
    	t.references :user
      t.timestamps null: false
    end
  end
end
