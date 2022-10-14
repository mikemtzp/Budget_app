class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :icon, presence: true
end
