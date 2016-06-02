$(document).ready(function() {
$('#showContacts').on('click', function() {
  
  $.ajax({
    method: 'GET',  
    datatype: 'json',
    url: '/contacts',
    success: function(contacts) {
      var table = $('#results').find('tbody').empty();
      $("#contactForm").hide();
 
      var temp = JSON.parse(contacts);
      for(var i=0; i<temp.length; i++)
      {
        var tr = $('<tr>').appendTo(table);
        $('<td>').text(temp[i].firstname).appendTo(tr);
        $('<td>').text(temp[i].lastname).appendTo(tr);
        $('<td>').text(temp[i].email).appendTo(tr);
        $('<td>').text(temp[i].phone).appendTo(tr);
       
      }
      $("#results").show();
    }
  });
});
$("#addContact").on('click', function(){
  $("#results").hide();
    $("#contactForm").show();

});

    $('#newContact').on('submit', function(event){
      event.preventDefault();
      var firstname = $('#firstname').val();
      var lastname = $('#lastname').val();
      var email = $('#email').val();
      var phone = $('#phone').val();

    if (firstname == '' || lastname == '') {
      alert("you suck at filling out forms");
    } else {

    $.post('/contacts', {firstname: firstname, lastname: lastname, email: email, phone: phone}, function(results){
      if (results.result) {
        alert("Contact successfully added");
        $("#newContact")[0].reset();
      } else {
        alert("failed");
      }
    }, 'json');
   }
  });
  $('#search').on('keyup', function(event){
    if (event.keyCode == 13) {
      var search = $('#search').val();

      if (search == '') {
        return false;
      }
    $.getJSON('/search/'+ search, function(contacts) {
      var table = $('#results').find('tbody').empty();
      $("#contactForm").hide();
 
      var temp = JSON.parse(contacts);
      for(var i=0; i<temp.length; i++)
      {
        var tr = $('<tr>').appendTo(table);
        $('<td>').text(temp[i].firstname).appendTo(tr);
        $('<td>').text(temp[i].lastname).appendTo(tr);
        $('<td>').text(temp[i].email).appendTo(tr);
        $('<td>').text(temp[i].phone).appendTo(tr);
       
      }
      $("#results").show();

    });
    }
  });
  $(".delete").on('click', function (){
    var id = $(this).data('playerId');
  })
});
