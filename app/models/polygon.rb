class Polygon < ApplicationRecord
  has_many :labels, dependent: :destroy

  has_one_attached :file
  has_one_attached :preview

  validates :file, attached: true, content_type: :glb
  validates :preview, attached: true, content_type: ['image/png', 'image/jpeg']
end
