class Encounter < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :user
  belongs_to :client
  belongs_to :encounter_type

  validates :client_id,
          :encounter_date,
          :duration,
          :encounter_type_id,
          :notes,
          presence: true

end
