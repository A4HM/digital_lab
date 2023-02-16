class LabSectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @lab = Lab.find(params[:lab_id])
    @videos = @lab.lab_videos
    @lab_sections = @lab.lab_sections
  end
  
  def create
    @lab_section = Lab.find(params[:lab_id]).lab_sections.build(name: params[:lab_section][:name], logo: params[:lab_section][:logo])
    if @lab_section.save
      redirect_to lab_lab_sections_path(params[:lab_id]), notice: "Item created successfully"
    else
      render :new, alert: "Error", status: :unprocessable_entity
    end
  end

  def new
    @lab_section = Lab.find(params[:lab_id]).lab_sections.build
  end

  def edit
    @lab_section = LabSection.find(params[:id])
  end

  def show
    # @lab_section = LabSection.find(params[:id])
  end

  def update
    @lab_section = LabSection.find(params[:id])
    if params[:lab_section][:logo]
      if @lab_section.update(name: params[:lab_section][:name], logo: params[:lab_section][:logo])
        redirect_to lab_lab_sections_path(@lab_section.lab.id), notice: "Item updated successfully"
      else
        render :edit, alert: "Error", status: :unprocessable_entity
      end 
    else
      if @lab_section.update(name: params[:lab_section][:name])
        redirect_to lab_lab_sections_path(@lab_section.lab.id), notice: "Item updated successfully"
      else
        render :edit, alert: "Error", status: :unprocessable_entity
      end 
    end
  end

  def destroy
    @lab_section = LabSection.find(params[:id])
    @lab_section.destroy
    redirect_to lab_lab_sections_path(@lab_section.lab.id), notice: "Item deleted successfully"
  end
end
