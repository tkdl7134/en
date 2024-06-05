$(function () {
        $(".product").click(function () {
          let w = "650";
          let h = "380";
          let left = Math.ceil((window.screen.width - w) / 2);
          let top = Math.ceil((window.screen.height - h) / 2);
          let option = `width=${w}, height=${h}, left=${left}, top=${top}`;
          window.open("pop.html", "_blank", option);
        });
      });