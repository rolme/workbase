class CompanyStatus < Registry
  # get default type
  def self.default
    find_by(label: 'trial')
  end
end
