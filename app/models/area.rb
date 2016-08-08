class Area < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :company
  belongs_to :created_by, class_name: User
end
