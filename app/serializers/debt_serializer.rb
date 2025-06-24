# frozen_string_literal: true

class DebtSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :name, :original_balance, :current_balance, :apr, :original_term, :minimum_payment,
             :original_interest, :remaining_interest, :principal_paid, :remaining_term
end
