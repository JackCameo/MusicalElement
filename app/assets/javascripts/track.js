
$(document).ready(function() {
  $('.stopbutton').hide();
  $('.playbutton').click(function() {
      
      soundManager.play('mySound-'+$(this).data("track-id"));
      var play_id = '.playbutton[data-track-id="'+$(this).data("track-id")+'"]';
      var stop_id = '.stopbutton[data-track-id="'+$(this).data("track-id")+'"]';
      $(play_id).hide();
      
      $(stop_id).show();
  });

  $('.stopbutton').click(function() {
    soundManager.pause('mySound-'+$(this).data("track-id"));
    var play_id = '.playbutton[data-track-id="'+$(this).data("track-id")+'"]';
    var stop_id = '.stopbutton[data-track-id="'+$(this).data("track-id")+'"]';
    $(stop_id).hide();
    $(play_id).show();

  });

});
