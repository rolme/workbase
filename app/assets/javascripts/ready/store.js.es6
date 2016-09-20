export default class Store {
  index() {
    $('.thumbnail').on('click', function() {
      window.location.href = $(this).data('url');
    });
  }
}

App.store = new Store();
