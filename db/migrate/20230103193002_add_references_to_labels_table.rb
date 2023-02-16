class AddReferencesToLabelsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :labels, :label_type, foreign_key: true
    remove_reference :label_types, :label
  end
end
