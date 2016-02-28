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
