// This is the global javascript file that will execute on every file.
// #init is executed on every page load.
import Sidebar from '../modules/sidebar.js.es6';

export default class Global {
  init() {
    $('.datepicker').datepicker();

    $("table tr[data-url]").on("click", function() {
      window.location.href = $(this).data('url');
    });

    new Sidebar();
  }
}

App.global = new Global();
