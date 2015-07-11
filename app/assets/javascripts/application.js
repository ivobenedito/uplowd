//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require refile
//= require handlebars
//= require filesize

$(document).on('ready page:load', function () {

  $('.js-btn-upload-photos-dialog').on('click', function () {
    $('.js-upload-photos-dialog').modal();
  });

  // $('.btn-file :file').on('change', function () {
  //   var $input = $(this),
  //       numFiles,
  //       label;
  //
  //   numFiles = $input.get(0).files ? $input.get(0).files.length : 1;
  //   label = $input.val().replace(/\\/g, '/').replace(/.*\//, '');
  //   $input.trigger('fileselect', [numFiles, label]);
  // });

  $('.btn-file :file').on('change', function () {
    $.each($(this).get(0).files, previewFile);
  });

  var previewFile = function (index, file) {
    var reader = new FileReader();

    reader.onloadend = function (e) {
      // var $item = $('<li>' + file.name + ' / ' + file.size + ' / ' + file.type + '</li>');

      var source = $('.js-preview-list-item-tpl').html();
      var template = Handlebars.compile(source);

      file.humanSize = filesize(file.size);

      $('.js-preview-list').append(template(file));

      // $preview.appendTo('.js-preview-list');
      console.debug(file);
    };

    reader.readAsDataURL(file);
  };


  // $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
  //   var $input = $(this);
  //
  //   if (numFiles > 0) {
  //     $.each($input.get(0).files, function (i, file) {
  //       var reader = new FileReader();
  //
  //       reader.onload = function (e) {
  //         var $el = $('<div class="photo-preview" style="float: left;"></div>');
  //         var $image = $(new Image()).attr('src', e.target.result);
  //         $image.addClass('img-responsive img-rounded');
  //
  //         $el.append($image);
  //         $el.appendTo($('.js-previews')).fadeIn();
  //       };
  //
  //       reader.readAsDataURL(file);
  //     });
  //   }

      // input = $(this).parents('.input-group').find(':text'),
      //     log = numFiles > 1 ? numFiles + ' files selected' : label;
      //
      // if( input.length ) {
      //     input.val(log);
      // } else {
      //     if( log ) alert(log);
      // }
  //
  // });

});



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

$(document).on('ready page:load', function () {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) { $('img.preview').attr('src', e.target.result); }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('input[type=file]').on('change', function () { readURL(this); });
});
