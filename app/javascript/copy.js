function copy() {
  var copyText = document.getElementById("copy_url");
  copyText.select();
  document.execCommand("copy");
  alert("Copied the text: " + copyText.value);
}