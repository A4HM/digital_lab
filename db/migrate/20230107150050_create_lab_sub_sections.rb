class CreateLabSubSections < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_sub_sections do |t|
      t.string :name
      t.references :lab_section, foreign_key: true
      t.timestamps
    end
  end
end
