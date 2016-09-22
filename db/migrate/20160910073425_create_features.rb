class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.string :name
      t.string :description
      t.decimal :monthly_price, precision: 8, scale: 2
      t.text :settings

      t.timestamps
    end
  end
end
