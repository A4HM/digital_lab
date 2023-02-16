class RemoveSomeReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :labels, :label_type
  end
end
