class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :project, foreign_key: true
      t.string :asset
      t.string :tags
      t.string :description
      t.string :content_type
      t.integer :file_size
      t.integer :width
      t.integer :height
      t.integer :length

      t.timestamps
    end
  end
end
