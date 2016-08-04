class Unit < ApplicationRecord
  include SoftDeletable

  attr_accessor :location_required

  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :project, optional: true
  belongs_to :unit_category

  scope :in_inventory, -> {
    where.not(location_id: nil)
  }

  scope :group_units, ->(company_id, options) {
    filter_inventory = 'AND location_id IS NOT NULL' if !!options[:in_inventory]
    filter_project   = "AND project_id = #{options[:project_id]}" if options[:project_id].present?

    query = <<-SQL
      SELECT
        max(client_description) AS client_description,
        count(unit_hash) AS count,
        max(description) AS description,
        max(id) AS id,
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
      GROUP BY unit_hash
    SQL

    self.find_by_sql(query)
  }

  scope :sorted, -> {
    order('manufacturer, model')
  }

  delegate :area_name,
           :location_name,
           :warehouse_name,
           to: :location

  delegate :label,
           to: :unit_category,
           prefix: true

  validates :cost, numericality: true, presence: true
  validates :manufacturer, presence: true
  validates :location_id, presence: true, if: :location_required?

  before_create :generate_qrcode
  before_save   :generate_unit_hash

  def location_required?
    !!location_required
  end

private

  def generate_qrcode
    self.uuid   = SecureRandom.uuid
    self.qrcode = RQRCode::QRCode.new(uuid).to_img.resize(200, 200).to_data_url
  end

  def generate_unit_hash
    self.unit_hash = Digest::MD5.hexdigest("#{unit_category_label}|#{manufacturer}|#{model}")
  end
end
