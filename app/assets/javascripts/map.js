
$(document).ready(function() {
  $(window).on("scroll", function(){
    if ($("#search-filter").hasClass("masked")) {
      if ($(window).scrollTop() > 20) {
        $("#map").addClass("map-fixed");
      } else {
        $("#map").removeClass("map-fixed");
      }
    } else {
      if ($(window).scrollTop() > 225) {
        $("#map").addClass("map-fixed");
      } else {
        $("#map").removeClass("map-fixed");
      };
    };
  });
});

