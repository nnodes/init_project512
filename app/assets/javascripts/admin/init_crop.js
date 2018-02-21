var jcrop_api = null;
var ratio_w = 1;
var ratio_h = 1
var crop_ratio = 1; // comment to set free crop dimensions

function updateCrop(coords) {
  $('#crop_x').val(coords.x*ratio_w);
  $('#crop_y').val(coords.y*ratio_h);
  $('#crop_w').val(coords.w*ratio_w);
  $('#crop_h').val(coords.h*ratio_h);
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
    var crop_height = $("#nn-cropbox").height();
    var crop_width = $("#nn-cropbox").width();
    $('.nn-image-preview').attr('src', img.src);
    img.onload = function(){
      var original_width = img.width;
      var original_height = img.height;
      var height = $("#nn-cropbox").height();
      var width = $("#nn-cropbox").width();
      ratio_h = original_height/height;
      ratio_w = original_width/width;
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
  }
  reader.readAsDataURL(image);
}

function editImageCrop(event) {
  var full = $('#nn-cropbox').data('full')
  var crop_height = $("#nn-cropbox").height();
  var crop_width = $("#nn-cropbox").width();
  var original_width = parseInt(($('#nn-cropbox').data('width')).split('x')[0])
  var original_height = parseInt(($('#nn-cropbox').data('width')).split('x')[1])
  $('.nn-image-preview').attr('src', full);
  var height = $("#nn-cropbox").height();
  var width = $("#nn-cropbox").width();
  ratio_h = original_height / height;
  ratio_w = original_width / width;
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
