class CreateAnatomySections < ActiveRecord::Migration[7.0]
  def change
    create_table :anatomy_sections do |t|
      t.string :title
      t.timestamps
    end
  end
end
