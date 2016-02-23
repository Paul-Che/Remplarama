//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require moment
//= require jquery-ui
//= require jquery.ui.touch-punch
//= require underscore
//= require gmaps/google
//= require owl.carousel
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


// $(document).ready(function(){
// $("#demo").rangeCalendar();
// });


$(document).ready(function(){
  var customizedRangeCalendar = $("#demo").rangeCalendar({theme:"full-green-theme"});
});



// $(document).ready(function(){
// $("#demo").rangeCalendar({
// lang: "en",
// theme: "green-theme",
// themeContext: this,
// startDate: moment(),
// endDate: moment().add('months', 12),
// start : "+7",
// startRangeWidth : 2,
// minRangeWidth: 1,
// maxRangeWidth: 14,
// weekends: true,
// autoHideMonths: false,
// visible: true,
// trigger: null,
// changeRangeCallback : function( el, cont, dateProp ) { return false; }
// });
// });


//
// $.fn.datepicker.dates['fr'] = {
//     days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
//     daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
//     daysMin: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
//     months: ["January", "Février", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
//     monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
//     today: "Today",
//     clear: "Clear",
//     format: "dd/mm/yyyy",
//     titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
//     weekStart: 0
//     // clearBtn: "mise à zéro"
// };



//   $(document).ready(function(){
//     $('.datepick').datepicker({
//       language: "fr",
//        daysOfWeekHighlighted: "0",
//        multidate: true,
//        todayHighlight: true,
//        calendarWeeks: true,
//        selectMultiple: true,
//        clearBtn: true,
//        multidateSeparator: "     -   ",
//     });
//   });
});
