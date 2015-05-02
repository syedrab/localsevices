class AddCompanyToTransaction < ActiveRecord::Migration
  def change
    add_reference :transactions, :company, index: true
    add_foreign_key :transactions, :companies
  end
end
