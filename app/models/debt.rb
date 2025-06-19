# frozen_string_literal: true

class Debt < ApplicationRecord
  belongs_to :user
  validates :name, :original_balance, :apr, :original_term, :minimum_payment, presence: true
end
