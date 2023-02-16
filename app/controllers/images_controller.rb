class ImagesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    @lab_sub_section = LabSubSection.find(params[:lab_sub_section_id])
    @images = @lab_sub_section.images.includes(:blob).references(:blob).sort_by{ |s| s.filename.to_s.split(/(\d+)/).map{ |e| Integer(e) rescue e}}
    # p @images
  end
  
  def create
    @lab_sub_section = LabSubSection.find(params[:lab_sub_section_id])
    if params[:images].present?
      params[:images].each do |image|
        @lab_sub_section.images.attach(image)
      end
    end
  end

  def new
    # @new_lab_section = LabSection.new
  end

  def edit
    # @lab_section = LabSection.find(params[:id])
  end

  def show

  end

  def update
    @image = ActiveStorage::Attachment.find(params[:id])
    
    @image.update(params[:image])
  end

  def destroy
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    
  end
end
