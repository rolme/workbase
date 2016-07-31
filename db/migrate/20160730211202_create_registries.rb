class CreateRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :registries do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
