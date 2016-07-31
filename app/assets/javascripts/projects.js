$("body[data-action='index'][data-controller='projects']").ready(
  function() {
    $('.table tr').on('click', function() {
      window.location.href = $(this).data('url');
    });
  }
);
