class Lab < ApplicationRecord
  has_one_attached :logo

  has_one_attached :summary
  has_many :lab_sections
  has_many :lab_videos



  def self.search(query)
    a = all.map do |lab|
      result1 = lab.lab_sections.map do |lab_section|
        result2 = lab_section.lab_sub_sections.map do |lab_sub_section|
          result3 = lab_sub_section.images.includes(:blob).references(:blob).where(["active_storage_blobs.filename ILIKE ?","%#{query}%"])
          r3 = result3.compact
          {lab_sub_section: lab_sub_section, images: r3} if r3.present?
        end
        r2 = result2.compact
        {lab_section: lab_section, lab_sub_sections: r2} if r2.present?
      end
      r1 = result1.compact
      {lab: lab, lab_sections: r1} if r1.present?
    end

    a.compact
  end



end
