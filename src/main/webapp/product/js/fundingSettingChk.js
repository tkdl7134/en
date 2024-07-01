function call(){
	 const wl_up_price = document.querySelector("input[name='wl_up_price']");
	 const product_price = document.querySelector("input[name='product_price']");

  if (isNaN(wl_up_price.value) || isEmpty(wl_up_price)) {
    // isNaN은 괄호 안에 value값, 값을 넣어주어야 함
    alert("数字を入力してください。");
    wl_up_price.focus();
    wl_up_price.value = "";
    return false;
  }

  if (isNaN(product_price.value) || isEmpty(product_price)) {
    // isNaN은 괄호 안에 value값, 값을 넣어주어야 함
    alert("数字を入力してください。");
    product_price.focus();
    product_price.value = "";
    return false;
  }
}