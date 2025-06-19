class CreateDebts < ActiveRecord::Migration[7.1]
  def change
    create_table :debts do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.decimal :original_balance, null: false, precision: 10, scale: 2
      t.decimal :current_balance, precision: 10, scale: 2
      t.decimal :apr, null: false, default: 0.00, precision: 6, scale: 3
      t.integer :original_term, null: false
      t.decimal :minimum_payment, null: false, precision: 10, scale: 2
      t.timestamps
    end
  end
end
