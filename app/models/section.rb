class Section < ApplicationRecord
  belongs_to :proposal
  belongs_to :section_type

  delegate :label,
           to: :section_type,
           prefix: true

  def style
    section_type_label
  end
end
