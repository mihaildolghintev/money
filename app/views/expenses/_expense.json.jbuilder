json.extract! expense, :id, :user_id, :expense_category_id, :amount, :created_at, :updated_at
json.url expense_url(expense, format: :json)
