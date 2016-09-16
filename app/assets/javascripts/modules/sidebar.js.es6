export default class Sidebar {
  constructor() {
    this.handleMinimizedNavBarToggleClick();
    this.handleNavBarToggleClick();
    this.handleSubNavBarToggle();
  }

  handleMinimizedNavBarToggleClick() {
    $(document).on("click",".navbar-toggle",function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  }

  handleNavBarToggleClick() {
    this.initMenu();
    $(".navbar-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("sidebar-toggle");
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

  handleSubNavBarToggle() {
    if ($(".toggled .sidebar-nav li.active div").hasClass("submenu")) {
      $(".page-content").addClass("toggled-content");
    }else if($(".dashboard  .sidebar-nav li.active div").hasClass("submenu")) {
      $(".page-content").addClass("toggled-content");
    }
  }
}
