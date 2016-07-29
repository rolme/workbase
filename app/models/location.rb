class Location < Area
  belongs_to :warehouse, class_name: Warehouse, foreign_key: :parent_id
end
