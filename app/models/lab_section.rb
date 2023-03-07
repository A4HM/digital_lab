class LabSection < ApplicationRecord
  has_one_attached :logo
  
  validates :logo, content_type: ['image/png', 'image/jpeg']

  belongs_to :lab
  has_many :lab_sub_sections, dependent: :destroy
end
