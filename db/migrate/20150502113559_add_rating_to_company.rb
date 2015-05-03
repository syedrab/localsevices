class AddRatingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :rating, :float
  end
end
