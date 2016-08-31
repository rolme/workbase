require 'rails_helper'

RSpec.describe Proposal, type: :model do
  let(:proposal) { FactoryGirl.create(:proposal) }

  describe '#create' do
    it "should set uuid" do
      expect(proposal.uuid).to_not eql(nil)
    end

    it "should set status to draft" do
      expect(proposal.status).to eql('draft')
    end
  end

  describe '#update' do
    it "should reset cache" do
      proposal.update_attribute(:proposal_status_id, ProposalStatus.create(company: proposal.company, label: 'Final').id)
      expect(proposal.status).to eql('Final')
    end
  end

  describe '#version! should create a copy' do
    it "with a versioned date" do
      saved_proposal = proposal.version!
      expect(saved_proposal.versioned_at).to_not eql(1)
    end

    it "that is not current" do
      saved_proposal = proposal.version!
      expect(saved_proposal.current).to eql(false)
    end

    it "that points to current's project" do
      saved_proposal = proposal.version!
      expect(saved_proposal.project_id).to eql(proposal.project_id)
    end

    it "with the same uuid" do
      saved_proposal = proposal.version!
      expect(saved_proposal.uuid).to eql(proposal.uuid)
    end

    it "which project does not point to" do
      saved_proposal = proposal.version!
      expect(saved_proposal.project.proposal_id).to_not eql(saved_proposal.project_id)
    end
  end
end
