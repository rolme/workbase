class ClientType < Registry

  # get default type
  def self.default
    find_by(label: 'lead')
  end
end
