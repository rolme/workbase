import React from 'react';
import ReactDOM from 'react-dom';

// TODO: Use this for drag and drop - http://gaearon.github.io/react-dnd/

export default class ProposalBuilder extends React.Component {
  render() {
    return <h1>Proposal Builder - {this.props.proposal.createdBy.name}</h1>;
  }
}
