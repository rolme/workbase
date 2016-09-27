class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :slug
      t.references :company, foreign_key: true
      t.string :title
      t.integer :priority, default: 0 # low
      t.integer :position, default: 0
      t.integer :assignee_id
      t.datetime :due_at
      t.datetime :completed_at
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tasks, :slug
    add_index :tasks, :priority
    add_index :tasks, :position
    add_index :tasks, :assignee_id
  end
end
