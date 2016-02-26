
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

  $(".hide-filter").click(function() {
    $('#search-filter').slideToggle( "slow", function() {
      // $('#search-filter').toggleClass('hidden');
      $('.hide-arrow').toggleClass('hidden');
    });
  });



$(document).ready(function(){

  var callbackRangeCalendar = $("#demo").rangeCalendar({
    theme:"blue-theme",
    changeRangeCallback: rangeChanged,
    start : "+1",
    startRangeWidth : 1,
    minRangeWidth: 1,
    maxRangeWidth: 360,
    weekends: true,
  });

  function rangeChanged(target,range){

    $("#sendDates").click(function(){
        $('#startDate').val(range.start);
        $('#endDate').val(range.end);
      });

    console.log(range.start);
    console.log(range.end);
    }

});


});
