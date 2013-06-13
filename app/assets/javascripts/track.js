
$(document).ready(function() {
  // $('.stopbutton').hide();
  $('.playbutton').click(function() {
      // $(this).data("track-id")
    soundManager.play('mySound-'+$(this).data("track-id"));
    $('.playbutton').data("track-id").hide();
    $('.stopbutton').show();
  });

  $('.stopbutton').click(function() {
    soundManager.stop('mySound-'+$(this).data("track-id"));
    $('.stopbutton').data("track-id").toggle();
    $(this).toggle();
  });

});