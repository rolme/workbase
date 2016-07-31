class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :company, foreign_key: true
      t.references :client, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :summary
      t.text :labor

      t.timestamps
    end
  end
end
