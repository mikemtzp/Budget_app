class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :icon, presence: true
end
