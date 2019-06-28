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
//=require jquery
//=require rails_sortable
//=require jquery-ui/widgets/sortable
//= require materialize
//= require activestorage
//= require turbolinks
//= require_tree .
//= require Chart.bundle
//= require chartkick

$(document).on('turbolinks:load', function() {
  $(".dropdown-trigger").dropdown();
  $('.sidenav').sidenav();
  $('select').formSelect();
  $('.modal').modal();
  $('#fade-out-target').fadeOut(4000);
  $('.sortable').railsSortable();
  M.updateTextFields();
  M.textareaAutoResize($('#logtextarea'));
  //Moves selected item(s) up or down in a list
  $.fn.moveUpDown = function(list, btnUp, btnDown) {
    var opts = $(list + ' option:selected');
    if (opts.length == 0) {
      alert("Nothing to move");
    }

    if (btnUp) {
      opts.first().prev().before(opts);
    } else if (btnDown) {
      opts.last().next().after(opts);
    }
  };
})
