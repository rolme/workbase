class CompanyStatus < Registry

  def self.default
    find_by(label: 'trial')
  end
end
