$(document).ready(function() {

  $('#book_title_input').on('input',function(e){
    var title = $(this).val();
    console.log(title);
  });

  // $( "#book_title" ).onkeyup(function() {
  //   var title = $(this).val();
  //   console.log(title);


    // $.ajax({
    //     url: "https://www.googleapis.com/books/v1/volumes?q=" + title
    // }).then(function(data) {
    //     for (var i = 0; i < response.items.length; i++) {
    //       var item = response.items[i];
    //       document.getElementById("received_metadata").innerHTML += "<br>" + item.volumeInfo.title;
    //     }

    // });
  // });
});