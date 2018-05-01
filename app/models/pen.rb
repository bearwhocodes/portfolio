class Pen < ApplicationRecord

  # Uploaders
  mount_uploader :image, PenImageUploader

  # Validations
  validates :name, :summary, :codepen_url, presence: true

  # Scopes
  scope :unarchived, -> { where(archived: false) }

  # Methods
  def to_s
    name
  end

end