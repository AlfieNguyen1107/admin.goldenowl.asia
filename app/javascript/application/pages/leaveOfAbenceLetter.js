import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/dark.css';
export const initFlatPickr = (
  dateSelector = '.datepicker',
  dateTimeSelector = '.datetimepicker',
) => {
  flatpickr(dateSelector, {
    altInput: true,
    allowInput: true,
    disableMobile: true
  });
  flatpickr(dateTimeSelector, { enableTime: true });
};

document.addEventListener('turbolinks:load', () => {
  const $numberOfDayOff = $('#leave_of_absence_letter_number_of_days')
  const diffDays = (date, otherDate) => parseFloat(Math.abs(date - otherDate) / (1000 * 60 * 60 * 24)).toFixed(2);
  initFlatPickr();

  $(document).on('change', '#leave_start_date, #leave_end_date', function(){
    let valueNumberOfDay = diffDays(new Date(leave_end_date.value), new Date(leave_start_date.value)).split('.');
    if(valueNumberOfDay[1] == 15) {
      $numberOfDayOff.val(parseInt(valueNumberOfDay[0]) + 0.5);
    } else {
      $numberOfDayOff.val(parseInt(valueNumberOfDay[0]) + 1);
    }
  });
});
