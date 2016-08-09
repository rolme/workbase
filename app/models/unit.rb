class Unit < ApplicationRecord
  include SoftDeletable
  include Sluggable

  attr_accessor :location_required

  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :project, optional: true
  belongs_to :unit_category, counter_cache: :count

  scope :in_inventory, -> {
    where.not(location_id: nil)
  }

  scope :group_units, ->(company_id, options) {
    filter_inventory = 'AND location_id IS NOT NULL' if !!options[:in_inventory]
    filter_project   = "AND project_id = #{options[:project_id]}" if options[:project_id].present?
    filter_location  = "AND location_id IN (#{options[:location_ids]})" if options[:location_ids].present?
    filter_search    = "
      AND (LOWER(units.manufacturer) LIKE '%#{options[:search]}%'
      OR LOWER(units.model) LIKE '%#{options[:search]}%'
      OR LOWER(units.description) LIKE '%#{options[:search]}%')
    " if options[:search].present?

    query = <<-SQL
      SELECT
        max(client_description) AS client_description,
        count(unit_hash) AS count,
        max(description) AS description,
        max(id) AS id,
        max(slug) AS slug,
        max(unit_category_id) AS unit_category_id,
        CASE WHEN MAX(CASE WHEN location_id IS NULL THEN 1 ELSE 0 END) = 0
        THEN MAX(location_id) END AS location_id,
        max(manufacturer) AS manufacturer,
        max(model) AS model,
        sum(cost) AS subtotal,
        unit_hash
      FROM units
      WHERE company_id = #{company_id}
      #{filter_inventory}
      #{filter_project}
      #{filter_location}
      #{filter_search}
      GROUP BY unit_hash
    SQL

    self.find_by_sql(query)
  }

  scope :sorted, -> {
    order('manufacturer, model')
  }

  delegate :name,               # area_name
           to: :area,
           prefix: true

  delegate :name,               # location_name
           to: :location,
           prefix: true

  delegate :name,               # warehouse_name
           to: :warehouse,
           prefix: true

  delegate :label,              # unit_category_label
           to: :unit_category,
           prefix: true

  validates :cost, numericality: true, presence: true
  validates :manufacturer, presence: true
  validates :location_id, presence: true, if: :location_required?

  before_create :generate_qrcode

  before_save   :generate_unit_hash,
                :checkin_unit

  def location_required?
    !!location_required
  end

  def check_in!
    update_attribute(:checkin_at, DateTime.current)
  end

private

  def generate_qrcode
    self.uuid   = SecureRandom.uuid
    self.qrcode = RQRCode::QRCode.new(uuid).to_img.resize(200, 200).to_data_url
  end

  def checkin_unit
    self.checkin_at = created_at if checkin_at.nil?
  end

  def generate_unit_hash
    self.unit_hash = Digest::MD5.hexdigest("#{unit_category_label}|#{manufacturer}|#{model}")
  end
end
