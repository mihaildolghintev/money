class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :balance, dependent: :delete
  has_many :incomes, dependent: :delete_all
  has_many :expenses, dependent: :delete_all
end
