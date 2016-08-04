module Sortable
  extend ActiveSupport::Concern

  included do
    include ::RankedModel

    ranks :position

    scope :ordered, -> { rank(:position) }
  end
end
