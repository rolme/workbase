class Warehouse < Area
  belongs_to :company
  has_many :locations, foreign_key: :parent_id
  has_many :units, through: :locations

  validates :name, uniqueness: { scope: :company_id }
end
