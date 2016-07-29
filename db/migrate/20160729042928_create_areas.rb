class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.references :company, foreign_key: true
      t.integer :created_by_id
      t.string :type
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :parent_id

      t.timestamps
    end
  end
end
