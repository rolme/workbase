class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.references :company, foreign_key: true
      t.string :slug, index: true
      t.string :company_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :fax
      t.string :email
      t.integer :client_status_id, index: true
      t.string :cached_status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
