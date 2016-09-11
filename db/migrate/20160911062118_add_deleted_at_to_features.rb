class AddDeletedAtToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :deleted_at, :datetime
  end
end
