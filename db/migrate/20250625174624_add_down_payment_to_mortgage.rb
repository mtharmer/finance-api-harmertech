class AddDownPaymentToMortgage < ActiveRecord::Migration[7.1]
  def change
    add_column :mortgages, :down_payment, :decimal, null: :false, default: 0.00, precision: 10, scale: 2
    add_column :mortgages, :original_balance_after_down_payment, :decimal, precision: 10, scale: 2
  end
end
