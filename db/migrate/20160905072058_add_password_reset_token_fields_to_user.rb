class AddPasswordResetTokenFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end
