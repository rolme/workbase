//= require cable
//= require_self
//= require_tree .

$(document).on('ready', function() {
  var ticket_slug = $('.row').data('ticket-slug');

  App.comments = App.cable.subscriptions.create({
    channel: 'CommentsChannel',
    ticket_slug: ticket_slug
  },{
    connected: function() {
      console.log('Comments connected.');
    },
    disconnected: function() {
      console.log('Comments disconnected.');
    },
    received: function(data) {
      $('#comments-form').before(data['comment']);
    }
  });
});
