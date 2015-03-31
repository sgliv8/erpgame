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
});


document.addEventListener('page:change', function() {
        document.getElementById('content-div').className += 'animated fadeIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('content-div').className += 'animated fadeOut';
});