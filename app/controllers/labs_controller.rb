class LabsController < ApplicationController
  before_action :authenticate_user!, except: [:show_lab]

  def edit

  end

  def show

  end

  def update

  end
  
  def show_lab
    @lab = Lab.find(params[:id])
  end

  def show_lab_section
    @lab_section = Lab.find(params[:lab_id]).lab_sections.find(params[:section_id])
  end

  def new_lab_section
    @lab_section = LabSection.new
  end

  def create_lab_section
    lab_section = Lab.find(params[:id]).lab_sections.new(lab_section_params)
    if lab_section.save
      redirect_to lab_path
    else
      render :new_lab_section, status: :unprocessable_entity
    end
  end

  def new_lab_sub_section
    @lab_sub_section = LabSubSection.new
  end

  def create_lab_sub_section
    lab_sub_section = Lab.find(params[:lab_id]).lab_sections.find(params[:section_id]).lab_sub_sections.new(lab_sub_section_params)
    if lab_sub_section.save
      redirect_to lab_section_path
    else
      render :new_lab_sub_section, status: :unprocessable_entity
    end
  end

  def show_lab_sub_section_images
    @sub_section = Lab.find(params[:lab_id]).lab_sections.find(params[:section_id]).lab_sub_sections.find(params[:sub_section_id])
    render "show_lab_sub_section_images"
  end

  def delete_image
    @image = ActiveStorage::Attachment.find(params[:image_id])
    @image.purge_later
  end

  def create_lab_sub_section_images
    lab_sub_section = Lab.find(params[:lab_id]).lab_sections.find(params[:section_id]).lab_sub_sections.find(params[:sub_section_id])
    if params[:lab_sub_section][:images].present?
      params[:lab_sub_section][:images].each do |image|
        lab_sub_section.images.attach(image)
      end
    end
    
  end


  private

  def lab_sub_section_params
    params.require(:lab_sub_section).permit(:name)
  end

  def lab_section_params
    params.require(:lab_section).permit(:name)
  end
end
