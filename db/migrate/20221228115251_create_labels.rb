class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :text
      t.float :x_coord
      t.float :y_coord
      t.float :z_coord
      t.timestamps
    end
  end
end
