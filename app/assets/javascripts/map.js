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


// $(function(){
//   // var map_width = $('#map').width();
//   $(window).on("scroll", function(){
//     if ($(window).scrollTop() > 220) {
//       $("#map").addClass("map-fixed");

//       // $("#map").width(map_width);
//       // console.log(map_width);
//     }
//     else {
//       $("#map").removeClass("map-fixed");

//     };
//   });
// });
