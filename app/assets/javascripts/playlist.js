// $(document).ready(function() {
//   $('#sortable').sortable({
//     update: function(){

//     var playlist = $('input.position');
//     var results = []
//     _.each(playlist, function(playlist, iterator) {
//         $(playlist).val(iterator);
//           console.log(iterator)
//     var id = $(playlist).data("ar-id");
//       results.push([id, iterator]);
//       });
//     }
//   });
// });

$(document).ready(function() {
    $( "#draggable" ).sortable();
    $( "#droppable" ).droppable({
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
          .find( "p" )
            .html( "Dropped!" );
      }
    });
  });