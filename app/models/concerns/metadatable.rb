module Metadatable
  extend ActiveSupport::Concern

  included do
    attr_accessor :metadata

    has_many :meta_values, dependent: :destroy
    has_many :text_values, dependent: :destroy
    has_many :checkbox_values, dependent: :destroy
    has_many :select_values, dependent: :destroy
    has_many :date_values, dependent: :destroy
    has_many :datetime_values, dependent: :destroy
    has_many :number_values, dependent: :destroy

    before_save :save_meta_value
  end

  def metadatum_value(metadatum_id)
    meta_values.find_by(metadatum_id: metadatum_id)&.value
  end

  private

  # save meta value with client
  def save_meta_value
    company.metadata.active.each do |md|
      case md.field_type
      when 'select'
        meta_value = select_values.where(metadatum_id: md.id).first_or_initialize
      when 'textfield'
        meta_value = text_values.where(metadatum_id: md.id).first_or_initialize
      when 'textarea'
        meta_value = text_values.where(metadatum_id: md.id).first_or_initialize
      when 'checkbox'
        meta_value = checkbox_values.where(metadatum_id: md.id).first_or_initialize
      when 'date'
        meta_value = date_values.where(metadatum_id: md.id).first_or_initialize
      when 'datetime'
        meta_value = datetime_values.where(metadatum_id: md.id).first_or_initialize
      when 'number'
        meta_value = number_values.where(metadatum_id: md.id).first_or_initialize
      end
      meta_value.value = metadata[md.name]
      meta_value.save
    end
  end
end