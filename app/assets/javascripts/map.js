// <<<<<<< HEAD
// $('.hide-arrow').click(function() {
//     $('#map').toggleClass('small-height');
//     $('#map').toggleClass('augmented_height');
// =======
$(function(){
  $(window).on("scroll", function(){
    if ($(window).scrollTop() > 220) {
      $("#map").addClass("map-fixed");
    }
    else {
      $("#map").removeClass("map-fixed");
    }
  })
// >>>>>>> master
});
