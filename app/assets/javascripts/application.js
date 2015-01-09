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
//= require jquery.nouislider.all.min.js
//= require_tree .
//= require bootstrap-sprockets
//= require jquery-ui
//= require jquery.flip.min.js
//= require jquery.tip_cards.js
//= require bootstrap-rating.min.js

$( document ).ready( function () {
  $(".create-link").click(function() {
    $(".hidden-form-container").fadeIn("slow")
    $(".create-link").hide()
  })

  $("#product-table").dataTable();

  $("#task-table").dataTable();

  $(".complete-check-box").change(function() {
    var form = $(this).closest('form')
    form.submit();
  })


  $(".tips").tip_cards({
    entrance: "bottom", // This option let you determine the direction of the fly in entrance animation when all the cards appears. Available options are "bottom", "left", "right", and "top". The default value is "bottom".
    column: 4, // The plugin also let you define how the card will be displayed and aligned. You can set the column of cards here. The default value is 4. 
    margin: "1%", // You can define the margins between each cards here. Percentage is currently support at this point. The default is "1%".
    selector: "> li", // You can define a custom selector if you do not want to use ul and li tags. This option accepts the normal CSS selector. The default value is "> li" 
    hoverTilt: "right", // Define the tilt direction when cards are hovered here. Available options are "right", "left", "up", and "down". The default value is "right".
    triggerSelector: "> li", // You can also define a custom selector for the trigger button here. The default value is "> li a" which will use the link inside a list as a trigger to activate the card. 
    cardFlyDirection: "all", // You can define the card fly animation when the modal appears here. Available options are "all", "top", "bottom", "left", and "right". The default value is "all" which will have the cards fly in from all direction and stack up under the opened modal
    closeButton: "X", // You can define the content of the close button here. Change this to false to prevent the plugin from automatically generating the close button. The default string is "X".
    flipButton: "Flip", // You can define the content of the flip button here. Change this to false to prevent the plugin from automatically generating the flip button. The default string is "Flip".
    navigation: true, // Set this to true to allow users to navigate from one card to another when modal is opened. Change it to false to disable it. The default value is true.
    beforeOpen: null, // A callback function that will be executed before the modal opens.
    afterOpen: null // A callback function that will be executed after the modal opens.
  });

  $(".text-area").keyup(function(){
    var wordCount = $(this).val().length
    $('.word-count').text(wordCount)
  })

}) 

