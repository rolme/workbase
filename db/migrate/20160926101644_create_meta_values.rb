class CreateMetaValues < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_values do |t|
      t.references :client, foreign_key: true
      t.references :metadatum, foreign_key: true
      t.string :text_value
      t.boolean :boolean_value
      t.integer :integer_value
      t.date :date_value
      t.datetime :datetime_value
      t.text :array_value, array: true, default: []
      t.string :type
      t.string :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end