$(function() {

	$('#notes').delegate('.delete', 'click', function() {
		$(this).closest('.note').remove();
	})

	$('#notes').delegate('.note', 'keydown', function(event) {

		console.log(event.which);

		if (event.which == 13)
		{
			//prevents normal keybind action
			event.preventDefault();

			// removes focus
			$(this).blur();

			var url = $(this).find('a').attr('href');
			var title = $(this).find('.title').html();
			var comment = $(this).find('.comment').html();

			$.ajax({

				type: 'PATCH',
				url: url,
				data: {

					note: {
						title: title,
						comment: comment
					}
				}


			})

		}
	})

});