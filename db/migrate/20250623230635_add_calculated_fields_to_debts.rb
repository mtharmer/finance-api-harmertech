class AddCalculatedFieldsToDebts < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :original_interest, :decimal, precision: 10, scale: 2
    add_column :users, :remaining_interest, :decimal, precision: 10, scale: 2
    add_column :users, :remaining_term, :integer
    add_column :users, :principal_paid, :decimal, precision: 10, scale: 2
  end
end
