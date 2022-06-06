import dayjs from 'dayjs'

document.addEventListener('turbolinks:load', () => {
  const $statusReleaseCheckBox = $('#status_release');
  const $itemHistoryEndDateInput = $('#item_history_end_date');
  const $itemHistoryStatusInput = $('#item_history_status')

  $statusReleaseCheckBox.on('change', (event) => {
    $itemHistoryEndDateInput.val( dayjs().format('YYYY-MM-DD'));
    $itemHistoryStatusInput.val(event.target.checked ? 'release' : 'hold');
  })
});
