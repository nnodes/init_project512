//= require jquery.Jcrop
//= require init_youtube
//= require admin/init_crop


$(document).on('turbolinks:load', function(){
  if($('div[id*="youtube-player-"').length > 0){
    loadYoutube();
  }
});

$(document).on('turbolinks:load page:restore', function(){
  $('#slide_image').on('change', function(event) {
    imageUpload(event);
  });
})
