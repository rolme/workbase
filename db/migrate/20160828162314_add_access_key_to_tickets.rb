class AddAccessKeyToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :access_key, :string

    # need to fill some default values
    Ticket.all.each do |ticket|
      ticket.access_key = SecureRandom.uuid
      ticket.save
    end

    change_column_null :tickets, :access_key, false
  end

  def down
    remove_column :tickets, :access_key, :string
  end
end
