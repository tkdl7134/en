// dimlayout만 적용할 때

$(function () {
  $(".preview").click(function () {
    var $el = $("#layer"); // pop-up 창
    $(".dim-layer").fadeIn();

    var $elWidth = ~~$el.outerWidth(),
      $elHeight = ~~$el.outerHeight(),
      docWidth = $(document).width(),
      docHeight = $(document).height();

    if ($elHeight < docHeight || $elWidth < docWidth) {
      $el.css({
        marginTop: -$elHeight / 2,
        marginLeft: -$elWidth / 2,
      });
    } else {
      $el.css({ top: 0, left: 0 });
    }

    $("a.btn-layerClose").click(function () {
      console.log(this);
      $(".dim-layer").fadeOut();
    });

    $(".dimBg").click(function () {
      $(".dim-layer").fadeOut();
    });
  });
});
