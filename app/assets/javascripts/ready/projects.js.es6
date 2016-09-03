import React from 'react';
import ReactDOM from 'react-dom';
import ProposalBuilder from "../components/proposal_builder.js.jsx";

export default class Projects {
  show() {
    const proposal = $('#proposal-builder').data('proposal');
    ReactDOM.render(<ProposalBuilder proposal={proposal} />, document.getElementById('proposal-builder'));
  }
}

App.projects = new Projects();
