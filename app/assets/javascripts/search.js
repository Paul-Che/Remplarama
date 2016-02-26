$(document).ready(function() {
  $(".hide-filter").click(function() {
    $('#search-filter').slideToggle( "slow", function() {
      $('#search-filter').toggleClass('masked');
      $('.hide-arrow').toggleClass('hidden');
    });
  });
});
