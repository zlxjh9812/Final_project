$(function() {
		$('.searchType-empty, .searchType-movie, .searchType-tv').click(function() {
			const searchType = $(this).hasClass('searchType-empty') ? 'contentType' : 'contentType';
			const keyword = $(this).hasClass('searchType-empty') ? '' : $(this).hasClass('searchType-movie') ? 'movie' : 'tv';
			$('#search-form input[name=searchType]').val(searchType);
			$('#search-form input[name=keyword]').val(keyword);
			$('#search-form').submit();
		});
	});

	$(function() {
		var keyword = getUrlParameter('keyword');
		if (keyword === '') {
			$('.mycontent-select-all').css('color', 'white').css('background-color', 'coral');
		} else if (keyword === 'movie') {
			$('.mycontent-select-movie').css('color', 'white').css('background-color', 'coral');
		} else if (keyword === 'tv') {
			$('.mycontent-select-tv').css('color', 'white').css('background-color', 'coral');
		}
	});

	function getUrlParameter(name) {
		name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
		var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		var results = regex.exec(location.search);
		return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
	};

	$(function() {
		$('#search-text-form').submit(function(e) {
			e.preventDefault();
			var url = $(this).attr('action');
			var data = $(this).serialize();
			$.get(url, data, function(response) {
			});
		});
	});