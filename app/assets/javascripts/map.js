$(function(){
  $(window).on("scroll", function(){
    if ($(window).scrollTop() > 220) {
      $("#map").addClass("map-fixed");
    }
    else {
      $("#map").removeClass("map-fixed");
    }
  })
});
