//= require init_youtube

$(document).on("turbolinks:load", function() {
  if($('div[id*="youtube-player-"').length > 0){
   loadYoutube();
  }
  $('#nn-home-carousel').bind('slid.bs.carousel', function (e) {
    yt_player = false;
    check_youtube_players();
    if (!yt_player){
      $('#nn-home-carousel').carousel({pause: "hover"});
    }
  });
});
