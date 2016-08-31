class Project < ApplicationRecord
  include Sluggable
  include SoftDeletable

  attr_accessor :created_by_id

  belongs_to :client
  belongs_to :company
  belongs_to :proposal, optional: true
  belongs_to :project_status, optional: true

  has_many :attachments
  has_many :tickets
  has_many :units

  DEFAULT_STATUS = 'active'

  scope :sorted, -> {
    order(:created_at)
  }

   delegate :address,       # client_address
            :company_name,  # client_company_name
            :contact_name,  # client_contact_name
            :email,         # client_email
            :fax,           # client_fax
            :phone,         # client_phone
            to: :client,
            prefix: true

  delegate :title,          # proposal_title
           :status,         # proposal_status
           to: :proposal,
           prefix: true

  delegate :id,             # project_status_id
           :label,          # project_status_label
           to: :project_status,
           prefix: true

  before_create :create_project_status

  after_create :add_proposal

  before_save :update_cache

  def status
    cached_project_status
  end

  def materials
    units.group_units(company_id, { project_id: id })
  end

  def total_material_units
    materials.map{ |m| m.count }.reduce(&:+)
  end

  def total_material_cost
    materials.map{ |m| m.subtotal }.reduce(&:+)
  end

  def add_proposal
    Proposal.create(project: self, company: company, created_by_id: created_by_id, title: 'Initial Draft')
  end

  def create_project_status
    self.project_status = ProjectStatus.find_by(label: Project::DEFAULT_STATUS)
  end

  def update_cache
    self.cached_project_status = (project_status.nil?) ? Project::DEFAULT_STATUS : project_status_label
  end
end
