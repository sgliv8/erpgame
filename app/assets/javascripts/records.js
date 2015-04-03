$(document).ready(function(){
	// this handler will be invoked BEFORE the request is sent to the server, we can do checking here
	$('#record_round').on('ajax:before', function(evt) {
	  // 
	  // console.log($(this).val());
	  var roundInput = $('#record_round');
	  var userInput = $('#record_user_id');
	  console.log(roundInput);
	  console.log(userInput);

	  // we need both values to send a request
	  if(roundInput.val() && userInput.val()) {
	    // add parameters
	    roundInput.val(roundInput.val() - 1);
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
		var roundInput = $('#record_round');
		var record_begin_cash = $('#record_begin_cash');
		var error = $('#beginCashError');
		record_begin_cash.val('');
		error.html('');
		if ( data.length == 0 ) {
			if (roundInput.val() == 0){
				roundInput.val(parseInt(roundInput.val()) + 1);
				record_begin_cash.val(100000.0);
			}else {
				roundInput.val(parseInt(roundInput.val()) + 1);
				error.html('<p>No data available, please enter again!</p>');
			}
		}else {
			//console.log(roundInput);
			roundInput.val(parseInt(roundInput.val()) + 1);

			console.log(data);
			$.each(data, function(index, element){
				console.log(element.end_cash);
				record_begin_cash.val(element.end_cash);
			});
		}
		
		//$(this).val(($(this).val() + 1));
	  // data is now an array containing your objects 
	  // you can dump them on firebug or your web browser console using console.log(data); 
	}); 



	//retrieve all new data from different round
	$('#round').on('ajax:before', function(evt) {
	  // 
	  // console.log($(this).val());
	  var roundInput = $('#round');
	  //var userInput = $('#record_user_id');
	  console.log(roundInput);
	  //console.log(userInput);

	  // we need both values to send a request
	  if(roundInput.val()) {
	    // add parameters
	    //roundInput.val(roundInput.val() - 1);
	    $(this).data('params', roundInput.serialize());
	    console.log($(this).data('params'));
	  }
	  else
	  {
	    return false;
	  }
	});


		// this handler will be invoked when the request has completed successfully
	$('#round').on('ajax:success', function(evt, data) {
		var roundInput = $('#round');

			console.log(data);
			$('tr.cash').html('');
			$.each(data, function(index, element){
				var fullName = element.name + ' ' + element.last_name;
				$("table.table").append("<tr class='cash'><td>" + fullName + "</td><td>" + element.round + "</td><td>" + element.end_cash + "</td></tr>");
			});
		
		
	  // data is now an array containing your objects 
	  // you can dump them on firebug or your web browser console using console.log(data); 
	}); 

});


