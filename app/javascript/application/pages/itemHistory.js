const dayjs = require('dayjs');

document.addEventListener('turbolinks:load', () => {
  $('#status_release').on('click', (event) => {
    let d = new Date();
    today = dayjs(d).format('YYYY-MM-DD')
    $('#item_history_end_date').val(today);
    if(event.target.checked) {
      $('#item_history_status').val('release')
    } else {
      $('#item_history_status').val('hold')
    }
  })
});
