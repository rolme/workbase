class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :confirmed, default: false
      t.string :phone
      t.references :company, foreign_key: true
      t.string :type
      t.string :password_digest

      t.timestamps
    end
  end
end
