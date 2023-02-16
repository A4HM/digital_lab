class HomeController < ApplicationController
  def index
    @labs = Lab.all
  end

  def search
    @q = Lab.search(params[:query])
  end

  def show_3d_program
    @labels = Polygon.first.labels.includes(:label_type).references(:label_type).select("labels.id, labels.text, labels.x_coord, labels.y_coord, labels.z_coord, label_types.color, label_types.name").to_a
    @types = Polygon.first.label_types.select("name, color").to_a
    render "3d_program"
  end
end
