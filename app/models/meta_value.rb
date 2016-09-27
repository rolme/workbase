class MetaValue < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :client
  belongs_to :metadatum

  validates :metadatum_id, uniqueness: { scope: [:client_id] }
end
