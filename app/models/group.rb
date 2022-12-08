class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, through: :categorizations

  #  validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, presence: true
end
