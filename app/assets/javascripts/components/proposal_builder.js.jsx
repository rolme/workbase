import React from 'react';
import ReactDOM from 'react-dom';

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
          <div className="col-sm-8">
            Live preview
          </div>
          <div className="col-sm-4">
            actions
          </div>
        </div>
      </div>
    );
  }
}
