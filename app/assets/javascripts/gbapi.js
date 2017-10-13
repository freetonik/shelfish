$(document).ready(function() {

  var suggestedItems = [];

  $('#book_title').on('input', function(e){

    var title_input_data = $(this).val()
    if (title_input_data.length > 0) {
      
      var url = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyCO8zIG3fuQpeOuS-RB-C2L6gIbsvYESpw&fields=items(volumeInfo(title,authors))&q=" + title_input_data;
    
      $.getJSON( url, function( data ) {
        suggestedItems = [];
        var items = [];
        $.each( data.items, function( index, val ) {
          var title = val.volumeInfo.title;
          var author = val.volumeInfo.authors ? val.volumeInfo.authors[0] : null;
          suggestedItems.push([title, author]);


          var str = title;
          if (author) {
            str += ", " + author;
          } 

          items.push( "<li class='suggested_item' id='" + index + "'>" + str + "</li>" );
        });

        $( "#received_metadata" ).html(items.join(""));
      });
    }

  });

  $('#received_metadata').on('click', 'li.suggested_item', function(e){
    var i = Number($(this).attr('id'));
    console.log(suggestedItems[i]);
    $('#book_title').val(suggestedItems[i][0]);
    $('#book_author').val(suggestedItems[i][1]);
  });

});

