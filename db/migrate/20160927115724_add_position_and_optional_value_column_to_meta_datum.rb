class AddPositionAndOptionalValueColumnToMetaDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :metadata, :position, :integer
    add_column :metadata, :default_value ,:text, array: true, default: []
  end
end
