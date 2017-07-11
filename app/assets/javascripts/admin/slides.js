//= require jquery.Jcrop
var ytplayer;
var players = {};
var yt_playing = false;
var jcrop_api = null;
var ratio = 1;
// var crop_ratio = 1; uncomment for set crop dimensions

function update_crop(coords) {
  $('#crop_x').val(coords.x*ratio);
  $('#crop_y').val(coords.y*ratio);
  $('#crop_w').val(coords.w*ratio);
  $('#crop_h').val(coords.h*ratio);
}

function loadYoutube() {
    var tag = document.createElement('script');
    tag.type = 'text/javascript';
    tag.setAttribute('id', 'ytplayer-iframe');
    tag.src = "https://www.youtube.com/iframe_api";
    $('div[id*="youtube-player-"').append(tag);
    var firstScriptTag = $('#ytplayer-iframe')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}
function onYouTubeIframeAPIReady() {
  ytplayers = $('div[id*="youtube-player-"')
  $.each(ytplayers, function(i, ytp){
    createYTPlayer($(ytp).data("videoid"))
  });
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

function check_youtube_players(){
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
    $('#home-carousel').carousel({interval: 5000, pause: "hover"});
    $('#home-carousel').carousel('next');
  }else if (event.data == YT.PlayerState.PLAYING) {
    $('#home-carousel').carousel('pause');
  }
}

$(document).on('turbolinks:load', function(){
  $('.btn-file :file').on('change', function() {
    var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
  });
  $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
    var input = $(this).parents('.input-group').find(':text');
    log = numFiles > 1 ? numFiles + ' files selected' : label;
    if( input.length ) {
      input.val(log);
    } else {
      if( log ) alert(log);
    }
  });
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
      $('.image-preview-tag').css('height', '');
      $('.image-preview-tag').css('width', '');
      $('.image-preview-tag').attr('src', img.src);
      var original_width = document.getElementById("cropbox").offsetWidth;
      $('.image-preview-tag').css('height', 'auto');
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
