class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :expense_category, optional: true

  validates :amount, presence: true
end
