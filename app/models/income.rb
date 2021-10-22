class Income < ApplicationRecord
  belongs_to :user
  belongs_to :income_category, optional: true

  validates :amount, presence: true
end
