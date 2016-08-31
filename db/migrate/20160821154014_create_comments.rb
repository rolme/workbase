class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :ticket_id, null: false
      t.integer :user_id, null: false
      t.boolean :public, default: false

      t.timestamps
    end
    add_index :comments, :ticket_id
    add_index :comments, :user_id
  end
end
