class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :company_status_id, index: true
      t.string :cached_status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
