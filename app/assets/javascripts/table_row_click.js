// Any TABLE TR with a data-url attribute will trigger navigation on click.
$(document).on("click", "table tr[data-url]", function(ev) {
  window.location.href = $(this).data('url');
});
