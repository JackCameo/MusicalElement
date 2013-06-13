
$(document).ready(function(){
    var availableTags =
      $.ajax({
        type: "GET",
             source: "json",
             dataType: "json",
             url:'/friendships',

        success: function(json){
           $( "#tags" ).autocomplete({


            });
        }
      });
  });