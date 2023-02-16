class CreateLabSections < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_sections do |t|
      t.string :name
      t.references :lab, foreign_key: true
      t.timestamps
    end
  end
end
