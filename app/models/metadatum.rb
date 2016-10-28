class Metadatum < ApplicationRecord
  include Sluggable
  include SoftDeletable
  include Sortable

  has_many :meta_values, dependent: :destroy

  belongs_to :company
  belongs_to :metadatum_type

  validates :label,
            :metadatum_type_id,
            presence: true
  validates :label, uniqueness: { scope: :company_id }

  validate :default_array_value, if: :field_type_select?

  def field_type
    metadatum_type.label
  end

  private
  def field_type_select?
    metadatum_type && metadatum_type.label == 'dropdown'
  end

  def default_array_value
    if compact_value.blank?
      errors.add(:default, 'separate multiple value with space')
    else
      self.default = default.first&.split(' ')
    end
  end

  # check if blank string in array
  def compact_value
    default.reject{|v| v if v.blank?}
  end
end
