$(document).ready(function(){
  $('.datepick').datepicker({
      format: "dd/mm/yyyy",
      weekStart: 1,
      language: 'fr',
      autoclose: true,
      todayHighlight: true,
      // closeText: "Fermer",
      // prevText: "Précédent",
      // nextText: "Suivant",
      // currentText: "Aujourd'hui",
      monthNames: [ "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre" ],
      monthsShort: [ "janv.", "févr.", "mars", "avr.", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc." ],
      days: [ "dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi" ],
      daysShort: [ "dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam." ],
      daysMin: [ "D","L","M","M","J","V","S" ]
      // weekHeader: "Sem.",
      // dateFormat: "dd/mm/yy",
      // firstDay: 1,
      // isRTL: false,
      // showMonthAfterYear: false,
      // yearSuffix: ""
  });
});
