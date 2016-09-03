export default class Workbase {
  index() {
    $('.thumbnail').on('click', function() {
      window.location.href = $(this).data('url');
    });
  }
}

App.workbase = new Workbase();
