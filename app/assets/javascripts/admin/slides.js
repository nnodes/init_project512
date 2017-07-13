//= require jquery.Jcrop
//= require init_youtube
//= require admin/init_crop
//= require admin/upload_button

var createRules = {
  'slide[image]': {
      require_from_group: [1, ".fill-one"]
  },
  'slide[video_url]': {
      url: true,
      require_from_group: [1, ".fill-one"]
  },
  'slide[position]': {
    required: true
  }
}

var updateRules = {
  'slide[video_url]': {
      url: true,
  },
  'slide[position]': {
    required: true
  }
}
function addRequire(){
  $("#slide_image").rules('add', { require_from_group: [1, ".fill-one"] });
  $("#slide_video_url").rules('add', { require_from_group: [1, ".fill-one"] });
  console.log('agregue regla');
}
$(document).on('turbolinks:load', function(){

  if($('div[id*="youtube-player-"').length > 0){
    loadYoutube();
  }
});

$(document).on('turbolinks:load page:restore', function(){
  $('#slide_image').on('change', function(event) {
    imageUpload(event);
  });
  $('#slide-crop').on('click', function(event){
    editImageCrop(event)
  });
  $('#nn-del-image').on('ajax:success', function(){
    addRequire();
  })
  if($("form").length > 0){
    $("form").validate({
      rules: $('#nn-image-name').val().length > 0 ? updateRules : createRules
    });
  }
});
