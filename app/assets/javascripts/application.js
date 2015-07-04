//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require refile

$(document).on("upload:start", "form", function(e) {
  $(this).find("input[type=submit]").attr("disabled", true);
});

$(document).on("upload:complete", "form", function(e) {
  if(!$(this).find("input.uploading").length) {
    $(this).find("input[type=submit]").removeAttr("disabled");
  }
});

$(document).on("upload:progress", function() {
  console.debug('-');
});
