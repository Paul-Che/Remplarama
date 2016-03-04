/**
 * French translation for bootstrap-datepicker
 * Nico Mollet <nico.mollet@gmail.com>
 */
;(function($){
  $.fn.datepicker.dates['fr'] = {
    days: ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
    daysShort: ["dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam."],
    daysMin: ["D", "L", "Ma", "Me", "J", "V", "S"],
    months: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
    monthsShort: ["janv.", "févr.", "mars", "avril", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc."],
    today: "Aujourd'hui",
    monthsTitle: "Mois",
    clear: "Effacer",
    weekStart: 1,
    format: "dd/mm/yyyy"
  };
}(jQuery));


$(document).ready(function(){
  var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
  $.fn.bootstrapDP = datepicker;                 // give $().bootstrapDP the bootstrap-datepicker functionality
  $('.datepick').bootstrapDP({
      format: "dd/mm/yyyy",
      weekStart: 1,
      language: "fr",
      orientation: 'bottom auto',
      autoclose: true,
      todayHighlight: true
      // calendarWeeks: true
  });
});
