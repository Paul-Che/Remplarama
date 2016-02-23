//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function() {
  // var slider = $("#the_slider").slider({
  //     range: true,
  //     min: 0,
  //     max: 100,
  //     values: [70, 80],
  //     slide: function(event, ui) {
  //         $("#min-com").val(ui.values[0]);
  //         $("#max-com").val(ui.values[1]);
  //     }
  // });
  // $("#min-com").val(slider.slider("values")[0]);
  // $("#max-com").val(slider.slider("values")[1]);

  $(".hide-filter").click(function() {
    $('#search-filter').toggleClass('hidden');
    $('.hide-arrow').toggleClass('hidden');
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
