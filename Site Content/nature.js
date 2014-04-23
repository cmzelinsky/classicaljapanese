var tbody; // current one-state table
function votes() {
  hide_last();
  tbody = document.getElementById('tbody-' + this.id);
  tbody.style.display = "table-row-group";
  document.getElementById('current-state').innerHTML = this.id;
}
function initialize() {
  var wrappers = document.getElementsByClassName('wrapper');
  for (var i = 0; i < wrappers.length; i++) {
    wrappers[i].addEventListener('click', votes, false);
    wrappers[i].addEventListener('touchend', votes, false); // this doesn't seem to do anything
  }
  tbody = document.getElementById('tbody-PA');
}
function hide_last() {
  tbody.style.display = "none";
}
window.onload = initialize;