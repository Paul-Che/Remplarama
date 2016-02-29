$(document).ready(function() {
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100,
      values: [ $("#slider-range").data("value1"), $("#slider-range").data("value2") ],
      slide: function( event, ui ) {
        $( "#commission" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] + "%" );
      }
    });
    $( "#commission" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " - " + $( "#slider-range" ).slider( "values", 1 ) + "%" );
  });

  $(function() {
    $( "#slider-range2" ).slider({
      range: true,
      min: 0,
      max: 5,
      values: [ $("#slider-range2").data("value1"), $("#slider-range2").data("value2") ],
      slide: function( event, ui ) {
        $( "#rating" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#rating" ).val( $( "#slider-range2" ).slider( "values", 0 ) +
      " - " + $( "#slider-range2" ).slider( "values", 1 ) );
  });

  $(function() {
    $( "#slider-single" ).slider({
      min: 0,
      max: 100,
      value: $("#slider-single").data("value"),
      slide: function( event, ui ) {
        $( "#min_commission" ).val( ui.value + "%" );
      }
    });
    $( "#min_commission" ).val( $( "#slider-single" ).slider( "value" ) + "%" );
  });

});
