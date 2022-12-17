class Group < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :entities, through: :categorizations
  after_destroy :destroy_orphaned_entity

  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  #  validations
  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, presence: true

  private

  def destroy_orphaned_entity
    @entities = Entity.all
    @entities.each do |entity|
      entity.destroy if entity.groups.empty?
    end
  end
end
