class MortgageSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :original_balance, :down_payment, :original_balance_after_down_payment,
             :current_balance, :apr, :term, :payment, :tax, :insurance, :pmi,
             :extra_payment, :original_interest, :remaining_interest, :remaining_term,
             :original_interest_after_extra, :remaining_interest_after_extra, :remaining_term_after_extra
end
