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

   $( "#slider-range-max2" ).noUiSlider({
    start: 3,
    step: 1,
    connect: "lower",
    range: {
      'min': 1,
      'max': 10
    }
  });

   $( "#slider-range-max2" ).on('slide', function(){
    $( "#amount" ).val( Math.round($(this).val()) );
  })
 }
})
