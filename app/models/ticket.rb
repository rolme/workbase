class Ticket < ApplicationRecord
  has_paper_trail only: [:title, :description, :status, :assigned_to]

  include Sluggable
  include SoftDeletable

  belongs_to :company
  has_many :comments, -> {where.not(created_at: nil)}

  validates_presence_of :title, :description

  before_save :check_status

  enum status: { unviewed: 0, unassigned: 1, assigned: 2, closed: 9 }

  scope :open, -> { where.not(status: :closed) }

  def assignee
    assigned_to.present? ? User.find_by(id: assigned_to) : NullUser.new
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
end
