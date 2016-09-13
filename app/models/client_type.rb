class ClientType < Registry
  include SoftDeletable
  has_many :clients

  validates :label, presence: true
end
