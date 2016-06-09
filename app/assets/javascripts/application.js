// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require ckeditor/init
//= require ckeditor/config
//= require bootstrap
//= require app
//= require Chart
//= require excanvas
//= require_tree .
//= require cocoon

// $('.ckeditor').ckeditor({
//   // optional config
// });



// $('a[data-popup]').on('click', function(e) {
// 	 window.open($(this).attr('href')); e.preventDefault(); 
// 	});

$(document).ready(function() {
  $.AdminLTE2.layout.activate();
});

$(document).on('page:load', function() {
  var o;
  o = $.AdminLTE2.options;
  if (o.sidebarPushMenu) {
    $.AdminLTE2.pushMenu.activate(o.sidebarToggleSelector);
  }
  $.AdminLTE2.layout.activate();
});