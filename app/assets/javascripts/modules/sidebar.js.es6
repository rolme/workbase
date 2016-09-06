export default class Sidebar {
  constructor() {
    $("#wrapper").toggleClass("toggled-2");
    this.handleMenuToggleClick();
    this.handleMenuToggle2Click();
  }

  handleMenuToggleClick() {
    $(document).on("click","#menu-toggle",function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  }

  handleMenuToggle2Click() {
    this.initMenu();
    $("#menu-toggle-2").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled-2");
      $('#menu ul').hide();
    });
  }

  initMenu() {
    $('#menu ul').hide();
    $('#menu ul').children('.current').parent().show();
    $('#menu li a').click(
      function() {
        var checkElement = $(this).next();
        if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
          return false;
        }
        if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
          $('#menu ul:visible').slideUp('normal');
          checkElement.slideDown('normal');
          return false;
        }
      }
    );
  }
}
