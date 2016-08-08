class Registry < ApplicationRecord
  include Sluggable
  include SoftDeletable
  include Sortable

  belongs_to :company, optional: true
end
