$(document).on('turbolinks:load', function() {
  function check_status_cbk(check_box, field) {
    if($('#' + check_box).is(':checked')) {
      $('#' + check_box).val(1);
      $('#'+ field).show();
    } else {
      $('#' + check_box).val(0);
      $('#'+ field).hide();
    }
  };

  check_status_cbk('check_status_item', 'item_employee_id');
  $(document).on('click', '#check_status_item', function () {
    check_status_cbk('check_status_item', 'item_employee_id');
  });
});
