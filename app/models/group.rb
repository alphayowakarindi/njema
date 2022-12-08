class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, through: :categorizations
end
