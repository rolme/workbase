class AddExtraColumnToMetadatum < ActiveRecord::Migration[5.0]
  def change
    add_column :metadata, :placeholder, :string
    add_column :metadata, :min, :integer
    add_column :metadata, :max, :integer
  end
end
