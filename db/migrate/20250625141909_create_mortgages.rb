class CreateMortgages < ActiveRecord::Migration[7.1]
  def change
    create_table :mortgages do |t|
      t.decimal :original_balance, null: :false, precision: 10, scale: 2
      t.decimal :current_balance, precision: 10, scale: 2
      t.decimal :apr, null: :false, default: 0.000, precision: 6, scale: 3
      t.integer :term, null: :false
      t.decimal :payment, null: :false, precision: 10, scale: 2
      t.decimal :tax, default: 0.00, precision: 10, scale: 2
      t.decimal :insurance, default: 0.00, precision: 10, scale: 2
      t.decimal :pmi, default: 0.00, precision: 10, scale: 2
      t.decimal :extra_payment, default: 0.00, precision: 10, scale: 2
      t.decimal :original_interest, precision: 10, scale: 2
      t.decimal :remaining_interest, precision: 10, scale: 2
      t.integer :remaining_term
      t.decimal :original_interest_after_extra, precision: 10, scale: 2
      t.decimal :remaining_interest_after_extra, precision: 10, scale: 2
      t.integer :remaining_term_after_extra
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
