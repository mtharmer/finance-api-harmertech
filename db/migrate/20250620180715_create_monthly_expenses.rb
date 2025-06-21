class CreateMonthlyExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_expenses do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.string :expense_type
      t.integer :due_day
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
