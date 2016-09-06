import React from 'react';
import ReactDOM from 'react-dom';
import ProposalBuilder from "../components/proposal_builder.js.jsx";

export default class Projects {
  show() {
    // TODO: Not sure if security risk. Maybe ajax the data after load?
    const proposal = $('#proposal-builder').data('proposal');
    ReactDOM.render(<ProposalBuilder proposal={proposal} />, document.getElementById('proposal-builder'));
  }
}

App.projects = new Projects();
