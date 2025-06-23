# frozen_string_literal: true

class MonthlyExpenseSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :name, :amount, :expense_type, :due_day
end
