export default class Sidebar {
  constructor() {
    this.initializeSubMenu();
    this.handleNavigationToggle();
  }

  // TODO: Find a way to NOT sneak in a tag.
  initializeSubMenu() {
    $('li.active > div.submenu').length && $("#content").addClass('submenu');
  }

  handleNavigationToggle() {
    $(document).on("click","#sidebar-toggle",function(e) {
      e.preventDefault();
      $("#content").toggleClass("sidebar-expanded");
      $("#content").toggleClass("sidebar-minimized");
    });
  }
}
