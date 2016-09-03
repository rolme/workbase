// This is the global javascript file that will execute on every file.
// #init is executed on every page load.
export default class Global {
  constructor() {
    this.init();
  }

  init() {
    $('.datepicker').datepicker();

    $("table tr[data-url]").on("click", function() {
      window.location.href = $(this).data('url');
    });
  }
}

App.global = new Global();
