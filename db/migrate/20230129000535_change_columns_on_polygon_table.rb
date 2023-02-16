class ChangeColumnsOnPolygonTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :polygons, :polygon_src_file_path
    remove_column :polygons, :preview_src_file_path
  end
end
