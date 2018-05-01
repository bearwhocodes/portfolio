class Technology < ApplicationRecord

  # Relationships
  has_and_belongs_to_many :projects

  # Uploaders
  mount_uploader :icon, TechnologyIconUploader

  # Validations
  validates :name, presence: true

  # Methods
  def to_s
    name
  end
  
end
