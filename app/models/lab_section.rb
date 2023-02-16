class LabSection < ApplicationRecord
  has_one_attached :logo
  
  belongs_to :lab
  has_many :lab_sub_sections, dependent: :destroy
end
