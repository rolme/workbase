class InventoryMailer < ApplicationMailer
  
  def checkout_email(warehouse)
    email = warehouse.created_by.email
    mail(to: email , subject: "eWorkbase: An item has been chekout from inventory.")
  end
end
