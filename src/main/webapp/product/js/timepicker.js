$(function () {
  //   $(".timepicker").timepicker();

  $(".timepicker").timepicker({
    timeFormat: "HH:mm",
    interval: 10,
    minTime: "10:00",
    maxTime: "20:00",
    // defaultTime: "10:00",
    startTime: "10:00",
    dynamic: false,
    dropdown: true,
    scrollbar: false,
  });
});
