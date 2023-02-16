class CreateLabelsTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :labels_types do |t|
      t.references :label, foreign_key: true
      t.references :label_type, foreign_key: true
      t.timestamps
    end
  end
end
