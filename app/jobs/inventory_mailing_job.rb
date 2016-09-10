class InventoryMailingJob < ActiveJob::Base

  def perform(warehouse)
    InventoryMailer.checkout_email(warehouse).deliver
  end
end
