class Metadatum < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :company
  belongs_to :metadatum_type

  validates :name,
            :metadatum_type_id,
            presence: true
  validates :name, uniqueness: { scope: :company_id }
end
