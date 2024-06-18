$(function () {
  $("#specialDate").datepicker({
    // changeYear: true,
    // changeMonth: true,
  });
  $("#specialDate").datepicker("fadeIn", $(this).val());
});

$.datepicker.setDefaults({
  dateFormat: "yy.mm.dd DD",
  prevText: "先月",
  nextText: "来月",
  monthNames: [
    "1月",
    "2月",
    "3月",
    "4月",
    "5月",
    "6月",
    "7月",
    "8月",
    "9月",
    "10月",
    "11月",
    "12月",
  ],
  monthNamesShort: [
    "1月",
    "2月",
    "3月",
    "4月",
    "5月",
    "6月",
    "7月",
    "8月",
    "9月",
    "10月",
    "11月",
    "12月",
  ],
  dayNames: ["日", "月", "火", "水", "木", "金", "土"],
  dayNamesShort: ["日", "月", "火", "水", "木", "金", "土"],
  dayNamesMin: ["日", "月", "火", "水", "木", "金", "土"],
  showMonthAfterYear: true,
  yearSuffix: "年",
});
