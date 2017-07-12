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

  $("form").validate({
    rules: {
      'slide[image]': {
          required: function(element) {
              return $("#slide_video_url").is(':empty');
          }
      },
      'slide[video_url]': {
          required: function(element) {
              return $("#slide_image").is(':empty');
          }
      }
    }
  });
})
