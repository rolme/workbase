class Section < ApplicationRecord
  # TODO: Should we allow uploading of images here?
  # include Bootsy::Container

  belongs_to :proposal
  belongs_to :section_type

  delegate :label,
           to: :section_type,
           prefix: true

  before_save :update_cache

  def style
    cached_section_type
  end

private

  def update_cache
    self.cached_section_type = section_type_label
  end
end
