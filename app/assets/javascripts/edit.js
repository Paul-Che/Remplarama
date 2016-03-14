$(document).ready(function() {
  $( "#user_avatar" ).addClass("hidden");
  $('input[type="file"]').attr('title', window.webkitURL ? ' ' : '');

  $("#edit-avatar").click(function() {
    $("input[id='user_avatar']").click();
});
});
