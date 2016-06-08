$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $("#num_ticket").change(function() {
    var current_price = parseInt($("#total").html());
    var number_tickets = parseInt($("#num_ticket").val());
    $("#total").html((current_price*number_tickets).toFixed(2));
  });
});
