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
    units.group_units(company_id)
  end

  def total_material_units
    materials.map{ |m| m.count }.reduce(&:+)
  end

  def total_material_cost
    materials.map{ |m| m.subtotal }.reduce(&:+)
  end
end
