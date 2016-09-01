class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :image
      t.string :uploadable_type
      t.integer :uploadable_id

      t.timestamps
    end
  end
end
