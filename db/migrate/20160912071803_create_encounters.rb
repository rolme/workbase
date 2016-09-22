class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.integer :client_id
      t.integer :user_id, foreign_key: true
      t.integer :encounter_type_id
      t.text :notes
      t.date :encounter_date
      t.integer :duration
      t.string :slug, index: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
