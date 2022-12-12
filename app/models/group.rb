class Group < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :entities, through: :categorizations

  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  #  validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, presence: true
end
