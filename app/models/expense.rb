class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
