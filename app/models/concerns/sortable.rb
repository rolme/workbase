module Sortable
  extend ActiveSupport::Concern

  included do
    include ::RankedModel

    ranks :position

    scope :ordered, -> { rank(:sort_order) }
  end
end
