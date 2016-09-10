class AddConfirmationToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :confirmed, :boolean, default: false
    add_column :clients, :confirmation_token, :string
    add_column :clients, :infoconfirm, :boolean, default: false
  end
end
