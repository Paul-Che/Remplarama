$(document).ready(function(){
  // var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
  // $.fn.bootstrapDP = datepicker;                 // give $().bootstrapDP the bootstrap-datepicker functionality
  $('.datepick').datepicker({
      format: "dd/mm/yyyy",
      weekStart: 1,
      language: "fr",
      autoclose: true,
      todayHighlight: true,
      // calendarWeeks: true
  });
});
