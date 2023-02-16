class CreateBiochemistries < ActiveRecord::Migration[7.0]
  def change
    create_table :biochemistries do |t|

      t.string :video_url
      t.timestamps
    end
  end
end
