$(function() {
  $("body[data-action='index'][data-controller='workbase']").find('.thumbnail').on('click', function() {
    window.location.href = $(this).data('url');
  });
});
