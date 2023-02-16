class PolygonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @polygons = Polygon.all
  end

  def show
    @polygon = Polygon.find(params[:id])
    @labels = @polygon.labels.select("id, x_coord, y_coord, z_coord, text").to_a
  end

  def new 
    @polygon = Polygon.new
  end

  def create
    @polygon = Polygon.new(name: params[:polygon][:name], file: params[:polygon][:file], preview: params[:polygon][:preview])
    if @polygon.save
      redirect_to polygons_path, notice: "3D model created successfully"
    else
      render :new, status: :unprocessable_entity, alert: "Something wrong happened"
    end
  end

  def edit
    @polygon = Polygon.find(params[:id])
  end

  def update
    @polygon = Polygon.find(params[:id])
    if @polygon.update(name: params[:polygon][:name], file: params[:polygon][:file], preview: params[:polygon][:preview])
      redirect_to polygons_path, notice: "3D model created successfully"
    else
      render :edit, status: :unprocessable_entity, alert: "Something wrong happened"
    end
  end

  def destroy
    @polygon = Polygon.find(params[:id])
    if @polygon.destroy
      redirect_to polygons_path, notice: "3D model deleted successfully"
    else
      render :edit, status: :unprocessable_entity, alert: "Something wrong happened"
    end
  end
end
