
$(document).ready(function() {
  $('.stopbutton').hide();
  $('.playbutton').click(function() {
      // $(this).data("track-id")
      soundManager.play('mySound-'+$(this).data("track-id"));
      var play_id = '.playbutton[data-track-id="'+$(this).data("track-id")+'"]';
      var stop_id = '.stopbutton[data-track-id="'+$(this).data("track-id")+'"]';
      $(play_id).hide();
      // $('.playbutton').data[value="this"].hide();
      $(stop_id).show();
  });

  $('.stopbutton').click(function() {
    soundManager.stop('mySound-'+$(this).data("track-id"));
    var play_id = '.playbutton[data-track-id="'+$(this).data("track-id")+'"]';
    var stop_id = '.stopbutton[data-track-id="'+$(this).data("track-id")+'"]';
    $(stop_id).hide();
    $(play_id).show();
    // $('.stopbutton').data("track-id").toggle();
    // $(this).toggle();
  });

});

// $('[data-track-id="91"]').hide()