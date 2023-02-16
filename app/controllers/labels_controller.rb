class LabelsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def show
    @label = Label.find(params[:id])
  end

  def create
    @label = Polygon.find(params[:polygon_id]).labels.new(x_coord: params[:label][:x_coord], y_coord: params[:label][:y_coord], z_coord: params[:label][:z_coord], text: params[:label][:text])
    if @label.save
      flash.now[:notice] = "Label created Successfully"
      render json: @label
    else
      flash.now[:alert] = "Something went wrong"
    end
    
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(x_coord: params[:label][:x_coord], y_coord: params[:label][:y_coord], z_coord: params[:label][:z_coord], text: params[:label][:text])
      flash.now[:notice] = "Label updated Successfully"
      render :show
    else
      flash.now[:alert] = "Something went wrong"
    end
  end

  def destroy
    @label = Label.find(params[:id])
    if @label.destroy
      flash.now[:notice] = "Label deleted successfully"
      render :deleted
    else
      flash.now[:alert] = "Something went wrong"
    end
  end
end
