class LabSubSectionsController < ApplicationController

  def index
    @lab_section = LabSection.find(params[:lab_section_id])
    @lab_sub_sections = @lab_section.lab_sub_sections.sort_by(&:created_at)
  end
  
  def create
    @lab_sub_section = LabSection.find(params[:lab_section_id]).lab_sub_sections.build(name: params[:lab_sub_section][:name], logo: params[:lab_sub_section][:logo])
    if @lab_sub_section.save
      redirect_to lab_section_lab_sub_sections_path(params[:lab_section_id]), notice: "Item created successfully"
    else
      render :new, alert: "Error", status: :unprocessable_entity
    end
  end

  def new
    @lab_sub_section = LabSection.find(params[:lab_section_id]).lab_sub_sections.build
  end

  def edit
    @lab_sub_section = LabSubSection.find(params[:id])
  end

  def show

  end

  def update
    @lab_sub_section = LabSubSection.find(params[:id])
    if params[:lab_sub_section][:logo]
      if @lab_sub_section.update(name: params[:lab_sub_section][:name], logo: params[:lab_sub_section][:logo])
        redirect_to lab_section_lab_sub_sections_path(@lab_sub_section.lab_section.id), notice: "Item updated successfully"
      else
        render :edit, status: :unprocessable_entity, alert: "Error"
      end 
    else
      if @lab_sub_section.update(name: params[:lab_sub_section][:name])
        redirect_to lab_section_lab_sub_sections_path(@lab_sub_section.lab_section.id), notice: "Item updated successfully"
      else
        render :edit, status: :unprocessable_entity, alert: "Error"
      end 
    end
  end

  def destroy
    @lab_sub_section = LabSubSection.find(params[:id])
    @lab_sub_section.destroy

    redirect_to lab_section_lab_sub_sections_path(@lab_sub_section.lab_section.id) , notice: "Item deleted successfully"
  end
end
