class Categorization < ApplicationRecord
  belongs_to :entity
  belongs_to :group

  #  validations
  validates :group_id, presence: true
end
