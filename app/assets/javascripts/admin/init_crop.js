var jcrop_api = null;
var ratio = 1;
var crop_ratio = 1; // comment to set free crop dimensions

function updateCrop(coords) {
  $('#crop_x').val(coords.x*ratio);
  $('#crop_y').val(coords.y*ratio);
  $('#crop_w').val(coords.w*ratio);
  $('#crop_h').val(coords.h*ratio);
}

function imageUpload(event) {
  var files = event.target.files;
  var image = files[0]
  var reader = new FileReader();
  reader.onload = function(file) {
    var img = new Image();
    img.src = file.target.result;
    if (jcrop_api !== null){
      jcrop_api.destroy()
    }
    var crop_height = document.getElementById("nn-cropbox").offsetHeight;
    var crop_width = document.getElementById("nn-cropbox").offsetWidth;
    $('.nn-image-preview').css('object-fit', '');
    $('.nn-image-preview').css('height', '');
    $('.nn-image-preview').css('width', '');
    $('.nn-image-preview').attr('src', img.src);
    var original_width = document.getElementById("nn-cropbox").offsetWidth;
    $('.nn-image-preview').css('object-fit', 'cover');
    $('.nn-image-preview').css('height', '100%');
    $('.nn-image-preview').css('width', '100%');
    var height = document.getElementById("nn-cropbox").offsetHeight;
    var width = document.getElementById("nn-cropbox").offsetWidth;
    ratio = original_width/width;
    crop_ratio = crop_width/crop_height;
    $('#nn-cropbox').Jcrop({
      onChange: updateCrop,
      onSelect: updateCrop,
      setSelect: [0, 0, width, height],
      aspectRatio: crop_ratio
    }, function(){
      jcrop_api = this;
    });
  }
  reader.readAsDataURL(image);
}

function editImageCrop(event) {
  var full = $('#nn-cropbox').data('full')
  var crop_height = document.getElementById("nn-cropbox").offsetHeight;
  var crop_width = document.getElementById("nn-cropbox").offsetWidth;
  var original_width = parseInt(($('#nn-cropbox').data('width')).split('x')[0])
  var original_height = parseInt(($('#nn-cropbox').data('width')).split('x')[1])
  $('.nn-image-preview').attr('src', full);
  var height = document.getElementById("nn-cropbox").offsetHeight;
  var width = document.getElementById("nn-cropbox").offsetWidth;
  ratio = original_width /  width;
  crop_ratio = crop_width/crop_height;
  $('#nn-cropbox').Jcrop({
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [0, 0, width, height],
    aspectRatio: crop_ratio
  }, function(){
    jcrop_api = this;
  });
}
