class Ticket < ApplicationRecord
  belongs_to :company

  enum status: { unviewed: 0, viewed: 1, assigned: 2, closed: 9 }
end
