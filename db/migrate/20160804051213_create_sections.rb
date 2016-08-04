class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.references :proposal, foreign_key: true
      t.integer :section_type_id, index: true
      t.string :cached_section_type
      t.string :header
      t.text :data

      t.timestamps
    end
  end
end
