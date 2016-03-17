$(document).ready(function() {
  $('#wrapper-conversations').scrollTop($('#wrapper-conversations').prop("scrollHeight"));

  $('.conversation-link').click(function () {
    setTimeout(function () {
      $('#wrapper-conversations').scrollTop($('#wrapper-conversations').prop("scrollHeight"));
    }, 500);
  });

  $('.send-message-button').click(function () {
    setTimeout(function () {
      $('#wrapper-conversations').scrollTop($('#wrapper-conversations').prop("scrollHeight"));
    }, 500);
  });

  console.log("scroll?");
});
