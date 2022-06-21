$(document).on('click', '#add-account-employee', function () {
  let employeeId = window.location.pathname.split('/')[2]
  $.ajax({
    url: employeeId + "/add_account_employee",
    type: 'POST',
    dataType: 'json',
    data: {
      email: $('#user_email').val(),
      password: $('#user_password').val()
    },
    success: function () {
      $('#close-modal').click();
      setTimeout( function () {
        alert('Account user was successfully created');
      }, 500);
      return true;
    }
  });
});
