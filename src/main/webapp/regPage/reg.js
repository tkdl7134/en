document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");

  form.addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent form submission for validation

    const id = document.getElementById("id").value;
    const password = document.getElementById("password").value;
    const name = document.getElementById("name").value;
    const kana = document.getElementById("kana").value;
    const birthdate = document.getElementById("birthdate").value;
    const gender = document.getElementById("gender").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const newsletter = document.getElementById("newsletter").value;

    // Simple validation checks
    if (
      id &&
      password &&
      name &&
      kana &&
      birthdate &&
      gender &&
      email &&
      phone &&
      newsletter
    ) {
      alert("Form submitted successfully!");
      form.submit(); // Submit the form if all fields are filled
    } else {
      alert("Please fill in all fields.");
    }
  });
});
