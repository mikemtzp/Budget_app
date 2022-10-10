class User < ApplicationRecord
  has_many :expenses, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
end
