class LabSubSection < ApplicationRecord
  has_one_attached :logo
  
  belongs_to :lab_section
  has_many_attached :images
  
  validates :logo, attached: true, content_type: ['image/png', 'image/jpeg']
  validates :images, content_type: ['image/png', 'image/jpeg']

end
