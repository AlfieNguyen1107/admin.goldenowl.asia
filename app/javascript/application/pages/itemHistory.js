document.addEventListener('turbolinks:load', () => {
  $('#status_completed').on('click', (event) => {
    let d = new Date();
    let month = (d.getMonth() + 1).toString();
    let day = d.getDate().toString();
    let year = d.getFullYear();

    if (month.length < 2) {
      month = '0' + month;
    }
    if (day.length < 2) {
      day = '0' + day;
    }

    today = [year, month, day].join('-');
    $('#item_history_end_date').val(today);
    if(event.target.checked) {
      $('#item_history_status').val('completed')
    } else {
      $('#item_history_status').val('in_progress')
    }
  })
});
