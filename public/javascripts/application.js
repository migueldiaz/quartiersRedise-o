 $(document).ready(function() {
	$('.delete_post').bind('ajax:success', function() {
		$(this).closest('tr').fadeOut();  
	});
});
