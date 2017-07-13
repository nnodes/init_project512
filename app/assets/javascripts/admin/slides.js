//= require jquery.Jcrop
//= require init_youtube
//= require admin/init_crop
//= require admin/upload_button


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
  $("form").validate({
    rules: {
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
  });
})
