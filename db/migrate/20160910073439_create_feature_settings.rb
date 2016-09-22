class CreateFeatureSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_settings do |t|
      t.string :type
      t.integer :type_id
      t.integer :feature_id
      t.text :settings

      t.timestamps
    end
    add_index :feature_settings, [:type, :type_id]
    add_index :feature_settings, :feature_id
  end
end
