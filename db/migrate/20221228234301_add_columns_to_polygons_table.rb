class AddColumnsToPolygonsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :polygons, :polygon_src_file_path, :string
    add_column :polygons, :preview_src_file_path, :string
  end
end
