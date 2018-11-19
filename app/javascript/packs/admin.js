// import {} from "jquery-ujs";

import "materialize-css/dist/js/materialize.js";
import "materialize-css/dist/css/materialize.css";

document.addEventListener("DOMContentLoaded", function() {
  const elems = document.querySelectorAll(".datepicker");
  window.M.Datepicker.init(elems, { format: "yyyy-mm-dd" });
});

document.addEventListener("DOMContentLoaded", function() {
  const elems = document.querySelectorAll("select");
  window.M.FormSelect.init(elems, {});
});
