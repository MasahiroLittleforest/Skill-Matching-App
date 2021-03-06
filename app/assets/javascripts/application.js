// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require_tree .

var today = new Date();
var currentYear = today.getFullYear();



$(document).ready(function(){
  $('.sidenav').sidenav();
  $('.modal').modal();
  $('.materialboxed').materialbox();
  $('select').formSelect();
  $('.datepicker').datepicker({
    yearRange: [1950, currentYear]
  });
  $('.timepicker').timepicker();
  $('#alert_close').click(function(){
    $("#alert_box").fadeOut("slow", function() {});
  });
});