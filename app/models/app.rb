class App < ApplicationRecord
  has_secure_token

  def self.system_token
    App.find_by(name: 'system').token
  end
end
