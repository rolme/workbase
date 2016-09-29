class CreateMetaValues < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_values do |t|
      t.references :client, foreign_key: true
      t.references :metadatum, foreign_key: true
      t.string :text_value
      t.string :select_value
      t.boolean :checkbox_value
      t.string :radio_button_value
      t.string :type
      t.string :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
