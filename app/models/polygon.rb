class Polygon < ApplicationRecord
  has_many :labels

  has_one_attached :file
  has_one_attached :preview
end
