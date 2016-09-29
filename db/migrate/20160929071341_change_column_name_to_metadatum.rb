class ChangeColumnNameToMetadatum < ActiveRecord::Migration[5.0]
  def change
    rename_column :metadata, :name, :label
    rename_column :metadata, :default_value, :default
  end
end
