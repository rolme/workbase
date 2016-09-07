class AddEmailConfirmColumnToLeadUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :lead_users, :confirmed, :boolean, :default => false
    add_column :lead_users, :confirm_token, :string
    add_column :lead_users, :email, :string
  end
end
