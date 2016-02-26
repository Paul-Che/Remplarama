$(document).ready(function() {
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100,
      values: [ 0, 100 ],
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
      values: [ 0, 5 ],
      slide: function( event, ui ) {
        $( "#rating" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#rating" ).val( $( "#slider-range2" ).slider( "values", 0 ) +
      " - " + $( "#slider-range2" ).slider( "values", 1 ) );
  });
});
