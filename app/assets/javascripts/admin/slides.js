//= require jquery.Jcrop
//= require init_youtube
var jcrop_api = null;
var ratio = 1;
// var crop_ratio = 1; uncomment for set crop dimensions

function update_crop(coords) {
  $('#crop_x').val(coords.x*ratio);
  $('#crop_y').val(coords.y*ratio);
  $('#crop_w').val(coords.w*ratio);
  $('#crop_h').val(coords.h*ratio);
}

$(document).on('turbolinks:load', function(){
  if($('div[id*="youtube-player-"').length > 0){
    loadYoutube();
  }
});

$(document).on('turbolinks:load page:restore', function(){
  $('#slide-crop').on('click', function(event){
    var full = $('#cropbox').data('full')
    var original_width = parseInt(($('#cropbox').data('width')).split('x')[0])
    var original_height = parseInt(($('#cropbox').data('width')).split('x')[1])
    $('.image-preview-tag').attr('src', full);
    var height = document.getElementById("cropbox").offsetHeight;
    var width = document.getElementById("cropbox").offsetWidth;
    ratio = original_width /  width;
    $('#cropbox').Jcrop({
      onChange: update_crop,
      onSelect: update_crop,
      setSelect: [0, 0, width, height]
      //aspectRatio: crop_ratio
    }, function(){
      jcrop_api = this;
    });
  });

  $('#slide_image').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      if (jcrop_api !== null){
        jcrop_api.destroy()
      }
      $('.image-preview-tag').css('object-fit', '');
      $('.image-preview-tag').css('height', '');
      $('.image-preview-tag').css('width', '');
      $('.image-preview-tag').attr('src', img.src);
      var original_width = document.getElementById("cropbox").offsetWidth;
      $('.image-preview-tag').css('object-fit', 'cover');
      $('.image-preview-tag').css('height', '100%');
      $('.image-preview-tag').css('width', '100%');
      var height = document.getElementById("cropbox").offsetHeight;
      var width = document.getElementById("cropbox").offsetWidth;
      ratio = original_width /  width;
      $('#cropbox').Jcrop({
        onChange: update_crop,
        onSelect: update_crop,
        setSelect: [0, 0, width, height]
        //aspectRatio: crop_ratio
      }, function(){
        jcrop_api = this;
      });
    }
    reader.readAsDataURL(image);

  });
})
