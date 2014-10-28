// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.dataTables.min.js
//= require_tree .
//= require jquery-ui

$( document ).ready( function () {
  $(".create-link").click(function() {
    $(".hidden-form-container").fadeIn("slow")
    $(".create-link").hide()

  })

  $("#product-table").dataTable();


  $( "#slider-range-max1" ).slider({
    range: "max",
    min: 1,
    max: 60,
    value: 20,
    slide: function( event, ui ) {
      $( "#duration" ).val( ui.value );
      // alert("Hey you asshole you moved me and my value is:" + ui.value);
    }
  });

  $( "#slider-range-max2" ).slider({
    range: "max",
    min: 1,
    max: 10,
    value: 3,
    slide: function( event, ui ) {
      $( "#amount" ).val( ui.value );
    }
  });
  


  // $( document ).ready( function () {
  //   $(".show-post-link").click(function() {
  //     $(".hidden-form-container").fadeIn("slow")
  // })

}) 

