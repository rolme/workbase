class UnitCategory < Registry
  belongs_to :company
  has_many :units
end
