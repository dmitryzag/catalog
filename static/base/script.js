const n = (x,y) => x + y;

$.post( "ajax/test.html", function( data ) {
  $( ".result" ).html( data );
});
