$(document).ready( function(){
 if ($('#slider-range-max1').length){
   $( "#slider-range-max1" ).noUiSlider({
    start: 20,
    step: 1,
    connect: "lower",
    range: {
      'min': 1,
      'max': 60
    }
  });
   $( "#slider-range-max1" ).on('slide', function(){
    $( "#duration" ).val( Math.round($(this).val()) );
  })
 }
})
