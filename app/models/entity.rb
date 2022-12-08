class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :goups, through: :categorizations

  #  validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :amount, presence: true
end
