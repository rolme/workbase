import React from 'react';

import ProposalPreview from './proposal_preview.js.jsx';
import ProposalActions from './proposal_actions.js.jsx';

// TODO: Use this for drag and drop - http://gaearon.github.io/react-dnd/

export default class ProposalBuilder extends React.Component {
  render() {
    return(
      <div className="proposal-builder-wrapper">
        <div className="row">
          <div className="col-sm-12">
            <h1>Proposal Builder - {this.props.proposal.createdBy.name}</h1>
          </div>
        </div>
        <div className="row">
          <ProposalPreview proposal={this.props.proposal} />
          <ProposalActions proposal={this.props.proposal} />
        </div>
      </div>
    );
  }
}
