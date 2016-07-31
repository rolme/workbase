class Location < Area
  belongs_to :company
  belongs_to :warehouse, class_name: Warehouse, foreign_key: :parent_id

  has_many :units
end
