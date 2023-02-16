class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.belongs_to :editor, index: true, foreign_key: true
      t.timestamps
    end
  end
end
