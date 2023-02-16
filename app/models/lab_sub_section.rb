class LabSubSection < ApplicationRecord
  has_one_attached :logo
  
  belongs_to :lab_section
  has_many_attached :images
end
