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
//= require select_all.js

$(document).on('turbolinks:load', function() {
  $(".dropdown-trigger").dropdown();
  $('.sidenav').sidenav();
  $('select').formSelect();
  $('.modal').modal();
  $('#fade-out-target').fadeOut(4000);
  $('.sortable').railsSortable();
  M.updateTextFields();
  M.textareaAutoResize($('#logtextarea'));
  $('.datepicker').datepicker();
  $('.timepicker').timepicker();
  $('#checkAll').select_all();
  $('#select-all-checkboxes').change(function(){
    var is_checked = this.checked;
    $('.selectable-checkbox').each(function(){
      // alert ($('.selectable-checkbox').length)
      this.checked = is_checked;
    });
  });
  $('#release-drop-down').change(function(){
    // alert("/reports/release-filter" +" "+ $("#release_name").val())
    var release_version = $("#release_name").val();
    $.ajax({
      url: "/reports/releases",
      type: "GET",
      data: {release_name: release_version},
      success: function(data) { $("#release_results").html(data.responseText)},
      error: function(data) {}
    });
  });
  $('#testsuites-drop-down').change(function(){
    var release_version = $("#release_name").val();
    var test_cycle = $("#testcycle_name").val();
    var project =  $("#project_name").val();
    $.ajax({
      url: "/reports/testsuites",
      type: "GET",
      data: {release_name: release_version, testcycle_name: test_cycle, project_name: project}
    });
  });
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
  $('#everyselected_days').change(function(){
    if(this.checked){
      $('.datetimefield').hide();
      $('.daystopick').show();
    }else {
      $('.datetimefield').show();
      $('.daystopick').hide();
    }
  })
})
