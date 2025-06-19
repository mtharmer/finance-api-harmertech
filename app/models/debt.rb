class Debt < ApplicationRecord
  belongs_to :user
  validates_presence_of %i[name original_balance apr original_term minimum_payment]
end
