class Proposal < ApplicationRecord
  include SoftDeletable

  belongs_to :company, optional: true
  belongs_to :created_by, class_name: User
  belongs_to :project
  belongs_to :proposal_status, optional: true
  belongs_to :updated_by, class_name: User, optional: true

  has_many :sections

  delegate :label,
           to: :proposal_status,
           prefix: true

  DEFAULT_STATUS = 'Draft'

  before_create :create_uuid,
                :create_proposal_status

  after_create :create_association_on_project

  before_save :update_cache

  def status
    cached_proposal_status
  end

  def version!
    saved_proposal = self.dup
    saved_proposal.versioned_at = DateTime.current
    saved_proposal.current = false

    saved_proposal.save!
    saved_proposal
    # TODO: we need to create versions of sections also.
    # sections.each { |s| s.version!(saved_proposal.id) }
    # saved_proposal
  end

private

  def create_uuid
    self.uuid = SecureRandom.uuid if uuid.nil?
  end

  def create_proposal_status
    self.proposal_status_id = ProposalStatus.find_by(label: Proposal::DEFAULT_STATUS).id
  end

  def create_association_on_project
    project.update_attribute(:proposal_id, id) if project.proposal_id.nil?
  end

  def update_cache
    self.cached_proposal_status = (proposal_status.nil?) ? Proposal::DEFAULT_STATUS : proposal_status_label
  end
end
