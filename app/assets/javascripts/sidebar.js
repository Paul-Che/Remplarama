$(document).ready(function () {
  var pathname = window.location.pathname;
  if (pathname === "/accepted_bookings") {
    $('#menu-content li').removeClass('active');
    $('#accepted_bookings').addClass('active');
    $('#on-going-bookings-head').trigger("click");
  } else if (pathname === "/finished_bookings") {
    $('#menu-content li').removeClass('active');
    $('#finished_bookings').addClass('active');
    $('#on-going-bookings-head').trigger("click");
  } else if (pathname === "/sent_requests") {
    $('#menu-content li').removeClass('active');
    $('#sent_requests').addClass('active');
    $('#on-going-requests-head').trigger("click");
  } else if (pathname === "/received_requests") {
    $('#menu-content li').removeClass('active');
    $('#received_requests').addClass('active');
    $('#on-going-requests-head').trigger("click");
  }
});
