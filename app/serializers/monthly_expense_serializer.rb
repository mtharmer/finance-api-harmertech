class MonthlyExpenseSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :name, :amount, :expense_type, :due_day
end
