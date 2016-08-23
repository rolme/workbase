import React from 'react';
import ReactDOM from 'react-dom';

import ProposalBuilder from './components/proposal_builder.js.jsx';

$(function() {
  $("body[data-action='index'][data-controller='workbase']").find('.thumbnail').on('click', function() {
    window.location.href = $(this).data('url');
  });

  $("body[data-action='show'][data-controller='projects']").ready(function() {
    let proposal = $('#proposal-builder').data('proposal');
    ReactDOM.render(<ProposalBuilder proposal={proposal} />, document.getElementById('proposal-builder'));
  });
});
