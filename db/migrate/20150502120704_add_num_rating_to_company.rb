class AddNumRatingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :num_rating, :integer
  end
end
