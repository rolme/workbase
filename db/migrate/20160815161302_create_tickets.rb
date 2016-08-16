class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.integer :company_id
      t.integer :status, default: 0
      t.integer :created_by
      t.integer :viewed_by
      t.integer :assigned_to
      t.string :submitted_by_name
      t.string :submitted_by_email
      t.string :submitted_by_company
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tickets, :slug
    add_index :tickets, :company_id
    add_index :tickets, :status
  end
end
