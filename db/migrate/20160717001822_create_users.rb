class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :company, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.string :phone
      t.string :type
      t.string :password_digest
      t.integer :user_status_id, index: true
      t.string :cached_status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
