document.addEventListener('turbolinks:load', () => {
  $(document).on('click', '#status_completed', function () {
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    $('#item_history_end_date').val(today);
  });
});
