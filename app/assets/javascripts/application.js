// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$('#endcash').click(function(e){
		e.preventDefault();
		var sum = 0;
		sum = parseFloat($('#record_begin_cash').val()) - parseFloat($('#record_expenses').val()) + parseFloat($('#record_revenue').val()) - parseFloat($('#record_inventory_penalty').val()) - parseFloat($('#record_order_penalty').val());
		console.log(sum);

		$('#record_end_cash').val(sum);
	});


	$('.delete-confirm').on('click', function(e){
		$(this).parent().children('a').addClass('current');
		console.log($(this).parent().children('a'));
		e.preventDefault();
		swal({
            title: "Are you sure?",
            text: "You will not be able to recover this record!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: "No, cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false
          },
          function(isConfirm){
            if (isConfirm){
              $('.current').trigger('click');
              swal("Deleted successfully!", "The record has been deleted!", "success");
              //$('#delete').css('display', 'block');
              
              //$('#delete').css('display', 'none');
            } else {
              swal("Cancelled", "The records are safe :)", "error");
            }
        });
	});
});


document.addEventListener('page:change', function() {
        document.getElementById('content-div').className += 'animated fadeIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('content-div').className += 'animated fadeOut';
});