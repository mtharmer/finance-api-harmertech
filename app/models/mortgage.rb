class Mortgage < ApplicationRecord
  belongs_to :user

  validates_presence_of :original_balance, :apr, :term, :payment
end
