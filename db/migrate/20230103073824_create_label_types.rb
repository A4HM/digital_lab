class CreateLabelTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :label_types do |t|
      t.string :name
      t.string :color
      t.references :label, foreign_key: true
      t.timestamps
    end
  end
end