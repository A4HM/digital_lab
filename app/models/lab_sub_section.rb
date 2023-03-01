class LabSubSection < ApplicationRecord
  has_one_attached :logo
  
  validates :logo, attached: true, content_type: ['image/png', 'image/jpeg']

  belongs_to :lab_section
  has_many_attached :images
end
