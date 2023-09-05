function set_style(style) {
  if (style === "light") {
    document.getElementById("sheet_light").removeAttribute('disabled');
    document.getElementById("sheet_dark").disabled = true;
    localStorage.setItem('style_preference', "light");
  } else {
    document.getElementById("sheet_dark").removeAttribute('disabled');
    document.getElementById("sheet_light").disabled = true;
    localStorage.setItem('style_preference', "dark");
  }
}

function swap_style() {
  /* if dark preference is not set, default to light */
  if (document.getElementById("sheet_dark").disabled == true) {
    set_style("dark");
  } else {
    set_style("light");
  }
}

function get_style_preference() {
  var style_preference = localStorage.getItem('style_preference');
  set_style(style_preference);
}

/* vim: set ts=2 sw=2 sts=2: */
