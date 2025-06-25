class ChangeCurrentBalanceToBeRequired < ActiveRecord::Migration[7.1]
  def change
    change_column :mortgages, :current_balance, :decimal, null: :false, precision: 10, scale: 2
  end
end
