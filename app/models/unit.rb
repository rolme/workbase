class Unit < ApplicationRecord
  attr_accessor :location_required

  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :project, optional: true
  belongs_to :unit_type

  scope :in_inventory, -> {
    where.not(location_id: nil)
  }

  scope :grouped, -> {
    # SELECT max(description), max(manufacturer), avg(cost), unit_hash, count(unit_hash) FROM units GROUP BY unit_hash;
    select('
      unit_hash,
      count(unit_hash) AS count,
      max(manufacturer) AS manufacturer,
      max(model) AS model,
      max(description) AS description,
      max(cost) AS cost,
      max(id) AS id
    ').group(:unit_hash)
  }

  scope :sorted, -> {
    order('manufacturer, model')
  }

  delegate :area_name,
           :location_name,
           :warehouse_name,
           to: :location

  delegate :name,
           to: :unit_type,
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
    self.unit_hash = Digest::MD5.hexdigest("#{unit_type_name}|#{manufacturer}|#{model}")
  end
end
