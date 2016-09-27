class Task < ApplicationRecord
  include Sluggable
  include SoftDeletable
  include Sortable

  belongs_to :assignee, class_name: User, optional: true
  belongs_to :company

  enum priority: { low: 0, medium: 1, high: 2, critical: 3 } # defaults to low

  validates :company_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :company_id }

  scope :for_company, ->(company) { where(company_id: company.id) }
  scope :incomplete, ->() { where(completed_at: nil) }
end
