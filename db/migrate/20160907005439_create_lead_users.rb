class CreateLeadUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :lead_users do |t|
      t.string :email
      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.timestamps
    end
  end
end
