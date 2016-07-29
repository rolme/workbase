class Warehouse < Area
  has_many :locations, foreign_key: :parent_id
end
