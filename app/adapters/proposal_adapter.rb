class ProposalAdapter
  def initialize(proposal)
    @proposal = proposal
  end

  def as_hash
    sections = @proposal.sections.map do |section|
      {
        id: section.id,
        slug: section.slug,
        sectionType: {
          id: section.section_type_id,
          label: section.cached_section_type
        },
        header: section.header,
        data: section.data
      }
    end

    {
      createdAt: @proposal.created_at,
      createdBy: {
        name: @proposal.created_by.full_name,
        slug: @proposal.created_by.slug,
      },
      current: @proposal.current,
      id: @proposal.id,
      projectId: @proposal.project_id,
      sections: sections,
      slug: @proposal.slug,
      status: @proposal.cached_proposal_status,
      updatedAt: @proposal.updated_at,
      updatedBy: {
        name: @proposal.updated_by.try(:full_name),
        slug: @proposal.updated_by.try(:slug)
      },
      versionedAt: @proposal.versioned_at
    }
  end

  def as_json
    as_hash.to_json
  end
end
