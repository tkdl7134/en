// 해당 div 누르면 input 창 활성화
function addClickListener(boxId, photoId) {
  document.getElementById(boxId).addEventListener("click", function () {
    document.getElementById(photoId).click();
  });
}
addClickListener("je_photobox1", "je_photoInput1");
addClickListener("je_photobox2", "je_photoInput2");
addClickListener("je_photobox3", "je_photoInput3");
addClickListener("je_photobox4", "je_photoInput4");

// 2개의 div에 띄우기
function handleFileInputChange(event, outputId1, outputId2) {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const img1 = document.createElement("img");
      img1.src = e.target.result;

      const img2 = document.createElement("img");
      img2.src = e.target.result;

      const imageDisplay1 = document.getElementById(outputId1);
      const imageDisplay2 = document.getElementById(outputId2);

      imageDisplay1.innerHTML = "";
      imageDisplay2.innerHTML = "";

      imageDisplay1.appendChild(img1);
      imageDisplay2.appendChild(img2);
    };
    reader.readAsDataURL(file);
  }
}
document
  .getElementById("je_photoInput1")
  .addEventListener("change", function (event) {
    handleFileInputChange(event, "je_photoOut1", "je_photoPre1");
  });
document
  .getElementById("je_photoInput2")
  .addEventListener("change", function (event) {
    handleFileInputChange(event, "je_photoOut2", "je_photoPre2");
  });
document
  .getElementById("je_photoInput3")
  .addEventListener("change", function (event) {
    handleFileInputChange(event, "je_photoOut3", "je_photoPre3");
  });
document
  .getElementById("je_photoInput4")
  .addEventListener("change", function (event) {
    handleFileInputChange(event, "je_photoOut4", "je_photoPre4");
  });
