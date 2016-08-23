import React from 'react';
import ReactDOM from 'react-dom';

export default class ProposalBuilder extends React.Component {
  render() {
    return <h1>Proposal Builder - {this.props.proposal.createdBy.name}</h1>;
  }
}
