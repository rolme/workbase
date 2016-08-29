import React from 'react';
import ReactDOM from 'react-dom';
import ProposalBuilder from './components/proposal_builder.js.jsx';

$(() => {
  // Global methods
  $('.datepicker').datepicker();

  $("table tr[data-url]").on("click", function (ev) {
    window.location.href = $(this).data('url');
  });

  // Workbase Controller
  $("body[data-action='index'][data-controller='workbase']").find('.thumbnail').on('click', function() {
    window.location.href = $(this).data('url');
  });

  // Projects Controller
  $("body[data-action='show'][data-controller='projects']").on('click', () => {
    const proposal = $('#proposal-builder').data('proposal');
    ReactDOM.render(<ProposalBuilder proposal={proposal} />, document.getElementById('proposal-builder'));
  });
});
