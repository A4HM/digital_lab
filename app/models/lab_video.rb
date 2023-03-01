class LabVideo < ApplicationRecord
  belongs_to :lab

  validates :url, format: { with: /\A((http|https):\/\/)?(www.)?youtube.com\//,
                            message: "use a valid youtube url" }
  before_save :set_url

  def set_url 
    if self.url.include?("v=")
      self.url = "https://www.youtube.com/embed/" + self.url.split("v=").last
    elsif self.url.include?("embed")
      self.url = "https://www.youtube.com/embed/" + self.url.split("embed/").last
    end
  end
end
