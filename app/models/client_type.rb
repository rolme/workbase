class ClientType < Registry
  include SoftDeletable
  has_many :clients

  # get default type
  def self.default
    find_by(label: 'lead')
  end

end
