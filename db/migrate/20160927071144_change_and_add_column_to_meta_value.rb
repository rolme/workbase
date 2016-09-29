class ChangeAndAddColumnToMetaValue < ActiveRecord::Migration[5.0]
  def change    
    add_column :meta_values, :integer_value, :integer
    add_column :meta_values, :date_value, :date
    add_column :meta_values, :datetime_value, :datetime
    add_column :meta_values, :array_value, :text, array: true, default: []

    rename_column :meta_values, :checkbox_value, :boolean_value
    
    remove_column :meta_values, :select_value
    remove_column :meta_values, :radio_button_value
  end
end




