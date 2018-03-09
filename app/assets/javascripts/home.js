$(document).on("turbolinks:load", function() {

  if ($('div[id*="youtube-player-"]').length > 0){
    loadYoutube();
    onYouTubeIframeAPIReady();
  }
  $('#nn-home-carousel').bind('slid.bs.carousel', function (e) {
    yt_player = false;
    checkYoutubePlayers();
    if (!yt_player){
      $('#nn-home-carousel').carousel({pause: "hover"});
    }
  });
});
