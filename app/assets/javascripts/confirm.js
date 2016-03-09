$(function() {
  $('a[data-confirm]').click(function(ev) {
    var href = $(this).attr('href');

    if (!$('#dataConfirmModal').length) {
      $('body').append(
        '<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"> \
          <div class="modal-dialog"> \
            <div class="modal-content"> \
              <div class="modal-header"> \
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> \
                <h3 id="dataConfirmLabel">Merci de confirmer</h3> \
              </div> \
              <div class="modal-body"></div> \
              <div class="modal-footer"> \
                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Non</button> \
                <a class="btn btn-primary" id="dataConfirmOK">Oui</a> \
              </div> \
            </div> \
          </div> \
        </div> \
        ');
    }
    $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
    $('#dataConfirmOK').attr('href', href);
    $('#dataConfirmModal').modal({show:true});

    return false;
  });
});
