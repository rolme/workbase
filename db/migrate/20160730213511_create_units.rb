class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.references :company, foreign_key: true
      t.string :uuid
      t.string :unit_hash, null: false, index: true
      t.string :qrcode
      t.string :procurement_status
      t.integer :unit_type_id, index: true
      t.string :manufacturer, index: true
      t.string :model
      t.string :description
      t.string :client_description
      t.decimal :cost, precision: 8, scale: 2
      t.integer :location_id, index: true
      t.integer :project_id, index: true

      t.timestamps
    end
  end
end
