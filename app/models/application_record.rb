class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :with_company_id, ->(company_id) {
    where(company_id: company_id)
  }
end
