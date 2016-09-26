class Metadatum < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :company
  belongs_to :metadatum_type

  validates :name,
            :metadatum_type_id,
            presence: true
  validates :name, uniqueness: { scope: :company_id }

  def meta_type
    case self.name
    when 'select'
      'select_tag'
    when 'text'
      'text_tag'
    when 'text_area'
      'text_area_tag'
    when 'check_box'
      'check_box_tag'
    when 'radio_button'
      'radio_button_tag'
    end
  end
end
