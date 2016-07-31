class Unit < ApplicationRecord
  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :project, optional: true
  belongs_to :unit_type

  delegate :name,
           to: :unit_type,
           prefix: true

  before_create :generate_qrcode
  before_save   :generate_unit_hash

private

  def generate_qrcode
    self.uuid   = SecureRandom.uuid
    self.qrcode = RQRCode::QRCode.new(uuid).to_img.resize(200, 200).to_data_url
  end

  def generate_unit_hash
    self.unit_hash = Digest::MD5.hexdigest("#{unit_type_name}|#{manufacturer}|#{model}")
  end
end
