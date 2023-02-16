class CreateLabVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_videos do |t|
      t.string :url
      t.references :lab, foreign_key: true
      t.timestamps
    end
  end
end
