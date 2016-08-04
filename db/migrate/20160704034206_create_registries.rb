class CreateRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :registries do |t|
      t.integer :company_id, index: true, allow_nil: true
      t.string :label
      t.string :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
