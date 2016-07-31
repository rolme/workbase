class Location < Area
  belongs_to :company
  belongs_to :warehouse, class_name: Warehouse, foreign_key: :parent_id

  has_many :units

  before_save :update_cache

  def area_name
    "#{name}, #{warehouse_name}"
  end

  def warehouse_name
    cached_warehouse_name
  end

private

  def update_cache
    self.cached_warehouse_name = warehouse.name
  end
end
