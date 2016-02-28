$(document).ready(function(){
  $("#practice_select").change(function() {
    var action = $(this).val() == "true" ?  "search_practices" : "search_locums";
    $("#home-form").attr("action", "/" + action);
  });
});
