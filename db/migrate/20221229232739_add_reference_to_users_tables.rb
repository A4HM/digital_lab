class AddReferenceToUsersTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :labels, :polygon, index: true, foreign_key: true
  end
end
