//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function() {
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100,
      values: [ 75, 95 ],
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

  $(".hide-filter").click(function() {
    $('#search-filter').slideToggle( "slow", function() {
      // $('#search-filter').toggleClass('hidden');
      $('.hide-arrow').toggleClass('hidden');
    });
  });

  $(document).ready(function(){
    $('.datepick').datepicker({
      format: "dd/mm/yyyy",
      weekStart: 1,
      autoclose: true,
      todayHighlight: true
    });
  });
});
