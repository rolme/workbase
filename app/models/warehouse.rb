class Warehouse < Area
  belongs_to :company
  has_many :locations, foreign_key: :parent_id
end
