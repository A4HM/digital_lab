class CreatePolygons < ActiveRecord::Migration[7.0]
  def change
    create_table :polygons do |t|
      t.string :name
      t.json :polygon_data
      t.json :preview_data
      t.timestamps
    end
  end
end
