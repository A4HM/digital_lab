class LabVideosController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @lab_video = Lab.find(params[:lab_id]).lab_videos.build
  end

  def create
    @lab_video = Lab.find(params[:lab_id]).lab_videos.build(url: params[:lab_video][:url])
    if @lab_video.save
      redirect_to lab_lab_sections_path(@lab_video.lab.id), notice: "Video created successfully"
    else
      render :new, status: :unprocessable_entity, alert: "Something went wrong!"
    end
  end

  def edit
    @lab_video = LabVideo.find(params[:id])
  end

  def update
    @lab_video = LabVideo.find(params[:id])
    if @lab_video.update(url: params[:lab_video][:url])
      redirect_to lab_lab_sections_path(@lab_video.lab.id), notice: "Video updated successfully"
    else
      render :edit, status: :unprocessable_entity, alert: "Something went wrong!"
    end
  end

  def destroy
    @lab_video = LabVideo.find(params[:id])
    if @lab_video.destroy
      redirect_to lab_lab_sections_path(@lab_video.lab.id), notice: "Video deleted successfully"
    else
      render :edit, status: :unprocessable_entity, alert: "Something went wrong!"
    end
  end
end
