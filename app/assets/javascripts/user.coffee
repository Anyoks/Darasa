# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $.AdminLTE2.layout.activate()

$(document).on 'page:load', ->
  o = $.AdminLTE2.options
  if o.sidebarPushMenu
    $.AdminLTE2.pushMenu.activate(o.sidebarToggleSelector)
  $.AdminLTE2.layout.activate()