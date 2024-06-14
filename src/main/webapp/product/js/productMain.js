// dimlayout만 적용할 때

$(function () {
  $(".je_preview").click(function () {
    var $el = $("#je_layer"); // pop-up 창
    $(".je_dim-layer").fadeIn();

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

    $("a.je_btn-layerClose").click(function () {
      console.log(this);
      $(".je_dim-layer").fadeOut();
    });

    $(".je_dimBg").click(function () {
      $(".je_dim-layer").fadeOut();
    });
  });
});
