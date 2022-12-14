class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categorizations, dependent: :destroy
  has_many :groups, through: :categorizations

  #  validationss
  validates :name, presence: true, length: { maximum: 40 }
  validates :amount, presence: true
  validates :group_ids, presence: true

  HUMANIZED_ATTRIBUTES = {
    group_ids: 'Categories'
  }.freeze

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
