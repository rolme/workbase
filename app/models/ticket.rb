class Ticket < ApplicationRecord
  has_paper_trail only: [:title, :description, :status, :viewed_by, :assigned_to]

  include Sluggable
  include SoftDeletable

  belongs_to :company
  has_many :comments, -> {where.not(created_at: nil)}

  validates_presence_of :title, :description

  before_save :check_status, :generate_access_key

  enum status: { unviewed: 0, unassigned: 1, assigned: 2, closed: 9 }

  scope :open, -> { where.not(status: :closed) }

  def assignee
    assigned_to.present? ? User.find_by(id: assigned_to) : NullUser.new
  end

  def project
    project_id.present? ? Project.find_by(id: project_id) : NullProject.new
  end

  def external_path
    "/tickets/customer?access_key=#{access_key}"
  end

private

  def check_status
    return if self.closed?

    if viewed_by.nil?
      self.status = Ticket.statuses[:unviewed]
    elsif viewed_by.present? && assigned_to.nil?
      self.status = Ticket.statuses[:unassigned]
    elsif assigned_to.present?
      self.status = Ticket.statuses[:assigned]
    end
  end

  # Used as the link for customer external page viewing
  def generate_access_key
    return if self.access_key.present?
    self.access_key = SecureRandom.uuid
  end
end
