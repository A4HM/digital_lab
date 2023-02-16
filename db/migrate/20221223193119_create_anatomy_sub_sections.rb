class CreateAnatomySubSections < ActiveRecord::Migration[7.0]
  def change
    create_table :anatomy_sub_sections do |t|
      t.string :title
      t.references :anatomy_section, foreign_key: true
      t.timestamps
    end
  end
end
