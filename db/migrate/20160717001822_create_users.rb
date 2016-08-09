class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :company, foreign_key: true
      t.string :slug, index: true
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :avatar
      t.string :password_digest
      t.integer :user_status_id, index: true
      t.string :cached_status
      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.integer :security_question_id
      t.string :security_answer
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
