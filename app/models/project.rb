class Project < ApplicationRecord
  belongs_to :company
  belongs_to :client

  has_many :units

  scope :sorted, -> {
    order(:created_at)
  }

   delegate :address,
            :company_name,
            :contact_name,
            :email,
            :fax,
            :phone,
            to: :client,
            prefix: true

  def materials
    grouped_unit_totals = units.group(:unit_hash).count
    grouped_unit_keys   = grouped_unit_totals.keys
    grouped_units       = grouped_unit_keys.map { |k| units.find{ |u| u.unit_hash == k } }

    grouped_units.map do |gu|
      {
        count: grouped_unit_totals[gu.unit_hash],
        manufacturer: gu.manufacturer,
        model: gu.model,
        description: gu.description,
        client_description: gu.client_description,
        cost: gu.cost,
        in_inventory: units.find{ |u| u.unit_hash == gu.unit_hash && u.location_id.nil? }.nil?,
        subtotal: grouped_unit_totals[gu.unit_hash] * gu.cost
      }
    end.sort_by { |h| [h[:manufacturer],h[:model]] }
  end

  def total_material_units
    materials.map{ |m| m[:count] }.reduce(&:+)
  end

  def total_material_cost
    materials.map{ |m| m[:subtotal] }.reduce(&:+)
  end
end
