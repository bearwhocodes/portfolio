class Project < ApplicationRecord

  # Relationships
  has_and_belongs_to_many :technologies

  # Uploaders
  mount_uploader :image, ProjectImageUploader

  # Validations
  validates :name, :summary, :content, presence: true

  # Scopes
  scope :unarchived, -> { where(archived: false) }

  # Methods
  def to_s
    name
  end
  
end
