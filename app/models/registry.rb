class Registry < ApplicationRecord
  include SoftDeletable
  include Sortable

  belongs_to :company, optional: true
end
