class CreateMetadata < ActiveRecord::Migration[5.0]
  def change
    create_table :metadata do |t|
      t.references :company, foreign_key: true
      t.integer :metadatum_type_id
      t.string :name
      t.string :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
