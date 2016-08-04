class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :company, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :proposal_id
      t.integer :created_by_id
      t.integer :update_by_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :project_status_id
      t.string :cached_project_status
      t.string :cached_client_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
