$(document).ready(function() {

  $('.playbutton').click(function() {
      // $(this).data("track-id")
    soundManager.play('mySound-'+$(this).data("track-id"));
    $(this).data("track-id").toggle();
    $('.stopbutton').toggle();
  });

  $('.stopbutton').click(function() {
    soundManager.stop('mySound'+$(this).data("track-id"));
    $(this).toggle();
    $('.playbutton').toggle();
  });

});