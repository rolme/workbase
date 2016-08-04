class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.references :company, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :current, default: true
      t.string :type
      t.integer :created_by_id
      t.integer :updated_by_id
      t.string :uuid
      t.string :title
      t.integer :proposal_status_id
      t.string :cached_proposal_status
      t.datetime :versioned_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
