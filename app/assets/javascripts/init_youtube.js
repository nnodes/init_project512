var ytplayer;
var players = {};
var yt_playing = false;

function loadYoutube() {
    console.log('loading youtube')
    var tag = document.createElement('script');
    tag.type = 'text/javascript';
    tag.setAttribute('id', 'ytplayer-iframe');
    tag.src = "https://www.youtube.com/iframe_api";
    $('div[id*="youtube-player-"').append(tag);
    var firstScriptTag = $('#ytplayer-iframe')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}
function onYouTubeIframeAPIReady() {
  if (typeof(YT) !== 'undefined') {
    ytplayers = $('div[id*="youtube-player-"')
    $.each(ytplayers, function(i, ytp){
      createYTPlayer($(ytp).data("videoid"))
    });  
  }
}
function createYTPlayer(video_id){
  ytplayer = new YT.Player('youtube-player-'.concat(video_id), {
    height: "100%",
    width: "100%",
    playerVars: {'controls': 1,
    'rel': 0,
    'showinfo': 0,
    'fs': 0},
    videoId: video_id,
    events: {
      "onReady": createYTEvent('youtube-player-'.concat(video_id)),
      "onStateChange": onPlayerStateChange
    }
  });
  players['youtube-player-'.concat(video_id)] = ytplayer;
}

function checkYoutubePlayers(){
  $.each($('iframe[id*="youtube-player"'), function(i, iframe){
    player = players[$(iframe).attr('id')];
     if ($(iframe).parent().parent().hasClass('active')){
       yt_player = true;
       player.playVideo();
     } else {
       player.pauseVideo();
     }
   });
}

function createYTEvent(frameID) {
    return function (event) {
        event.target.mute();
        var player = players[frameID]; // Set player reference
        var the_div = $('#'+frameID);
        if (the_div.parent().parent().hasClass('active')){
          player.playVideo();
        }
    }
}

function onPlayerStateChange(event) {
  // -1 = UNSTARTED, 0 = ENDED, 1 = PLAYING, 2 = PAUSED, 3 = BUFFERING
  player = players[$(event.target.a).attr('id')];
  if (event.data == YT.PlayerState.ENDED){
    player.stopVideo();
    $('#nn-home-carousel').carousel({interval: 5000, pause: "hover"});
    $('#nn-home-carousel').carousel('next');
  }else if (event.data == YT.PlayerState.PLAYING) {
    $('#nn-home-carousel').carousel('pause');
  }
}