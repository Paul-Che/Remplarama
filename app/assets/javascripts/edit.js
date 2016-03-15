$(document).ready(function() {
  $( "#user_avatar" ).addClass("hidden");
  $('input[type="file"]').attr('title', window.webkitURL ? ' ' : '');

  $("#avatar-edit-filter").click(function() {
    $("input[id='user_avatar']").click();
  });

  $( "#avatar-edit-filter" ).mouseenter(function() {
    $(this).removeClass("imgDescription-hidden");
    $(this).addClass("imgDescription-show");
  });
  $( "#avatar-edit-filter" ).mouseleave(function() {
    $(this).removeClass("imgDescription-show");
    $(this).addClass("imgDescription-hidden");
  });



  if ($("#user_has_practice").val() === 'false') {
    $(".has_practice").addClass("hidden");
    $(".edit-urssaf").removeClass("hidden");
  } else {
    $(".has_no_practice").addClass("hidden");
    $(".edit-urssaf").addClass("hidden");
  };

  $("#user_has_practice").change(function() {
    var value = $(this).val();
    if (value === 'true') {
      $(".has_no_practice").addClass("hidden");
      $(".has_practice").removeClass("hidden");
      $(".edit-urssaf").addClass("hidden");
    } else if (value === 'false') {
      $(".has_practice").addClass("hidden");
      $(".has_no_practice").removeClass("hidden");
      $(".edit-urssaf").removeClass("hidden");
    };
  });



});
