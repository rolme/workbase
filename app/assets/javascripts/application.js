// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require select2-full
//= require bootsy
//= require_tree .
//= require_tree ./channels

import "babel-polyfill";

// Import Ready Objects that mimic Actions in its corresponding Rails controller.
import Workbase from "ready/workbase.js.es6";
import Projects from "ready/projects.js.es6";
import Units from "ready/units.js.es6";

// Executes javascript code based on controller and action.
import DomReady from "modules/dom_ready.js.es6";

$(() => {
  new DomReady(document);
});
