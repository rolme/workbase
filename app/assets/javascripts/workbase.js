$("body[data-action='index'][data-controller='workbase']").ready(
  function() {
    $('.thumbnail').on('click', function() {
      window.location.href = $(this).data('url');
    });
  }
);
