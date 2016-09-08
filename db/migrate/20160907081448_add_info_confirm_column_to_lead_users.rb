class AddInfoConfirmColumnToLeadUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :lead_users, :infoconfirmation, :boolean, :default => false
  end
end
