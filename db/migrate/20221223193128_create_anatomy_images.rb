class CreateAnatomyImages < ActiveRecord::Migration[7.0]
  def change
    create_table :anatomy_images do |t|
      t.references :anatomy_sub_sections
      t.timestamps
    end
  end
end
