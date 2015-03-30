$(document).ready(function(){
	// this handler will be invoked BEFORE the request is sent to the server, we can do checking here
	$('#record_round').on('change', function(evt) {
	  // $(this).val(($(this).val() - 1));
	  // console.log($(this).val());
	  var roundInput = $('#record_round');
	  var userInput = $('#record_user_id');
	  console.log(roundInput);
	  console.log(userInput);

	  // we need both values to send a request
	  if(roundInput.val() && userInput.val()) {
	    // add parameters
	    $(this).data('params', roundInput.serialize() + '&' + userInput.serialize());
	    console.log($(this).data('params'));
	  }
	  else
	  {
	    return false;
	  }
	});

	// this handler will be invoked when the request has completed successfully
	$('#record_round').on('ajax:success', function(evt, data) {

		console.log(data);
		$.each(data, function(index, element){
			console.log(element.end_cash);
			$('#record_begin_cash').val(element.end_cash);
		});
	  // data is now an array containing your objects 
	  // you can dump them on firebug or your web browser console using console.log(data); 
	}); 
});


// $(document).ready(function(){
// 	$('#record_round').change(function(){
//      var roundInput = $('#record_round');
//      var userInput = $('#record_user_id');

//      $.ajax({
//             type: 'POST',
//             url: '/records/getbegincash',
//             data: {  record_round: roundInput, rec : userInput },
//             dataType: 'json',
//             success: function(xhr, textStatus) {
//                 alert('awesome!!!');
//             },
//             error: function(xhr, textStatus, errorThrown) {
//                             alert('something went wrong');
//             }

//         });

//  	});


// });
